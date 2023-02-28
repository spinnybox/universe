use anchor_lang::prelude::*;
use anchor_lang::solana_program::program::invoke;
use anchor_lang::solana_program::system_instruction::transfer;

declare_id!("Fg6PaFpoGXkYsidMpWTK6W2BeZ7FEfcYkg476zPFsLnS");

#[program]
pub mod fundraiser {
  use std::u64;

  use super::*;

  pub fn initialize(ctx: Context<Initialize>, target: u64) -> Result<()> {
    require!(target > 0, DonateErrors::ZeroLamports);

    let platform = &mut ctx.accounts.platform;
    platform.authority = ctx.accounts.authority.key();
    platform.target = target;
    platform.collected = 0;
    platform.id_counter = 0;

    let top_donors = &mut ctx.accounts.top_donors;
    top_donors.donators = vec![];

    Ok(())
  }

  pub fn send(ctx: Context<Send>, id: u64, amount: u64) -> Result<()> {
    require!(amount > 0, DonateErrors::ZeroLamports);

    let platform = &ctx.accounts.platform;
    let Donates {
      id_counter,
      collected,
      target,
      authority: _platform_authority,
    } = *platform.as_ref();
    require!(id <= id_counter, DonateErrors::IDBiggerThanCounter);

    let donator = &ctx.accounts.donor;
    require!(target > collected, DonateErrors::TargetReached);

    let (from, from_info) = (&donator.key(), donator.to_account_info());
    let (to, to_info) = (&platform.key(), platform.to_account_info());

    let transfer_instruction = transfer(from, to, amount);
    invoke(&transfer_instruction, &[from_info, to_info])?; // Transfer lamports

    let platform = &mut ctx.accounts.platform;
    let donor_account = &mut ctx.accounts.donor_account;

    let mut next_id = id;
    if next_id == 0 {
      next_id = id_counter;
    }

    if next_id == id_counter {
      donor_account.address = ctx.accounts.donor.key();
      donor_account.amount = 0;
      platform.id_counter += 1;
    }

    donor_account.amount += amount;
    platform.collected += amount;

    let top_donors = &mut ctx.accounts.top_donors;
    let (current_amount, mut current_index) = (donor_account.amount, 0);
    let (mut min, mut min_index) = (u64::MAX, TopDonors::MAX_DONORS);
    let mut found = false;

    for (index, top_donor) in top_donors.donators.iter().enumerate() {
      if top_donor.amount < min {
        min = top_donor.amount;
        min_index = index;
      }

      if top_donor.address == donor_account.address {
        current_index = index;
        found = true;
        break;
      }
    }

    if !found {
      let donor = Donor {
        amount: donor_account.amount,
        address: donor_account.address,
      };

      if top_donors.donators.len() < TopDonors::MAX_DONORS {
        top_donors.donators.push(donor);
      } else if min < current_amount {
        top_donors.donators[current_index] = donor;
      }
    } else {
      top_donors.donators[current_index].amount = current_amount;
    }

    let event = DonationEvent {
      at: Clock::get()?.unix_timestamp,
      amount,
      platform_after: platform.collected,
      from: donor_account.address,
    };

    emit!(event);

    Ok(())
  }

  pub fn withdraw(ctx: Context<Withdraw>) -> Result<()> {
    let collected = ctx.accounts.platform.collected;
    require!(collected > 0, DonateErrors::NoCollectedLamports);

    let from = ctx.accounts.platform.to_account_info();
    let to = ctx.accounts.authority.to_account_info();

    let rent_exemption = Rent::get()?.minimum_balance(Donates::SIZE);
    let withdraw_amount = **from.lamports.borrow() - rent_exemption;
    // require!(withdraw_amount < collected, DonateErrors::NoLamportsForRent);

    **from.try_borrow_mut_lamports()? -= withdraw_amount;
    **to.try_borrow_mut_lamports()? += withdraw_amount;
    ctx.accounts.platform.collected = 0;

    emit!(WithdrawEvent {
      at: Clock::get()?.unix_timestamp,
      amount: withdraw_amount
    });

    Ok(())
  }
}

const PREFIX: &str = "fundraiser_platform";
const TOP_DONORS: &str = "top_donors";
const DONOR: &str = "donor";

#[derive(Accounts)]
#[instruction(target: u64)]
pub struct Initialize<'info> {
  #[account(mut)]
  pub authority: Signer<'info>,

  #[account(
    init,
    payer = authority,
    space = Donates::SIZE,
    seeds=[PREFIX.as_bytes(), authority.key().as_ref()],
    bump,
  )]
  pub platform: Account<'info, Donates>,

  #[account(
    init,
    payer = authority,
    space = TopDonors::SIZE,
    seeds = [PREFIX.as_bytes(), TOP_DONORS.as_bytes(), authority.key().as_ref()],
    bump,
  )]
  pub top_donors: Account<'info, TopDonors>,
  pub system_program: Program<'info, System>,
}

#[derive(Accounts)]
pub struct Withdraw<'info> {
  #[account(mut)]
  pub authority: Signer<'info>,
  #[account(
        mut,
        has_one = authority,
        seeds = [PREFIX.as_bytes(), platform.authority.key().as_ref()],
        bump
    )]
  pub platform: Account<'info, Donates>,
  pub system_program: Program<'info, System>,
}

#[derive(Accounts)]
#[instruction(id: u64, amount: u64)]
pub struct Send<'info> {
  /// This is the account which is sending the money. It also needs to sign the
  /// transaction.
  ///
  ///  If client sends `<=0` then the transaction will error.
  #[account(mut)]
  pub donor: Signer<'info>,
  pub system_program: Program<'info, System>,

  #[account(
    init_if_needed,
    payer = donor,
    space = Donor::SIZE,
    seeds = [
      PREFIX.as_bytes(),
      DONOR.as_bytes(),
      platform.key().as_ref(),
      id.to_string().as_bytes(),
    ],
    bump
  )]
  pub donor_account: Account<'info, Donor>,

  #[account(
    mut,
    seeds = [PREFIX.as_bytes(), platform.authority.key().as_ref()],
    bump
  )]
  pub platform: Account<'info, Donates>,

  #[account(
    mut,
    seeds = [PREFIX.as_bytes(), TOP_DONORS.as_bytes(), platform.authority.key().as_ref()],
    bump
  )]
  pub top_donors: Account<'info, TopDonors>,
}

#[account]
pub struct Donates {
  pub authority: Pubkey,
  pub target: u64,
  pub collected: u64,
  pub id_counter: u64,
}

impl Donates {
  pub const SIZE: usize = 8 + 32 + 8 * 3;
}

// TODO check if `anchor` still throws IdlError if we reuse existing struct with
// account macro https://github.com/Dikower/donation-platform/blob/06f1aa2836ddf3e132ec9cec52c20883b9f271e3/programs/donation-platform/src/lib.rs#L223-L228
#[account]
pub struct Donor {
  pub address: Pubkey,
  pub amount: u64,
}

impl Donor {
  /// Discriminator + PubKey + u64
  pub const SIZE: usize = 8 + 32 + 8;
}

#[account]
pub struct TopDonors {
  pub donators: Vec<Donor>,
}

impl TopDonors {
  pub const MAX_DONORS: usize = 10;
  /// Discriminator + Vec + (PubKey + u64) * Donators Amount
  pub const SIZE: usize = 8 + 4 + (32 + 8) * TopDonors::MAX_DONORS;
}

#[error_code]
pub enum DonateErrors {
  #[msg("Amount of lamports must be more than zero")]
  ZeroLamports,
  #[msg("Impossible to withdraw. No lamports were collected")]
  NoCollectedLamports,
  #[msg("The target was reached")]
  TargetReached,
  #[msg("Impossible to withdraw. Not enough lamports to pay rent")]
  NoLamportsForRent,
  #[msg("Passed ID is bigger than current ID counter")]
  IDBiggerThanCounter,
}

#[event]
pub struct DonationEvent {
  at: i64,
  amount: u64,
  platform_after: u64,
  from: Pubkey,
}

#[event]
pub struct WithdrawEvent {
  at: i64,
  amount: u64,
}
