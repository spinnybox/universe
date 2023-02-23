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

    let donate_platform = &mut ctx.accounts.donate_platform;
    donate_platform.authority = ctx.accounts.authority.key();
    donate_platform.target = target;
    donate_platform.collected = 0;
    donate_platform.id_counter = 0;

    let top_donators = &mut ctx.accounts.top_donators;
    top_donators.donators = vec![];

    Ok(())
  }
}

#[derive(Accounts)]
#[instruction(target: u64)]
pub struct Initialize<'info> {
  #[account(mut)]
  pub authority: Signer<'info>,

  #[account(
        init,
        payer = authority,
        space = Donates::SIZE,
        seeds = [b"donate_platform", authority.key().as_ref()]
        bump,
    )]
  pub donate_platform: Account<'info, Donates>,

  #[account(
        init,
        payer = authority,
        space = TopDonators::SIZE,
        seeds = [b"top_donators", authority.key().as_ref()]
        bump,
    )]
  pub top_donators: Account<'info, TopDonators>,

  pub system_program: Program<'info, System>,
}

#[derive(Accounts)]
pub struct Withdraw<'info> {
  #[account(mut)]
  pub authority: Signer<'info>,
  #[account(
        mut,
        has_one = authority,
        seeds = [b"donate_platform", donate_platform.authority.key().as_ref()],
        bump
    )]
  pub donate_platform: Account<'info, Donates>,
  pub system_program: Program<'info, System>,
}

#[derive(Accounts)]
#[instruction(id: u64, amount: u64)]
pub struct Send<'info> {
  // If client sends 0 it means, that there is no donator account
  #[account(mut)]
  pub donator: Signer<'info>,
  pub system_program: Program<'info, System>,

  #[account(
        init_if_needed,
        payer = donator,
        space = Donator::SIZE,
        seeds = [
            b"donate_platform_donator",
            donate_platform.key().as_ref(),
            id.to_string().as_bytes()
        ],
        bump
    )]
  pub donator_acc: Account<'info, Donator>,

  #[account(
        mut,
        seeds = [b"donate_platform", donate_platform.authority.key().as_ref()],
        bump
    )]
  pub donate_platform: Account<'info, Donates>,

  #[account(
        mut,
        seeds = [b"top_donators", donate_platform.authority.key().as_ref()],
        bump
    )]
  pub top_donators: Account<'info, TopDonators>,
}

#[account]
struct Donates {
  pub authority: Pubkey,
  pub target: u64,
  pub collected: u64,
  pub id_counter: u64,
}

impl Donates {
  pub const SIZE: usize = 8 + 32 + 8 * 3;
}

#[account]
pub struct Donator {
  pub address: Pubkey,
  pub amount: u64,
}

impl Donator {
  // Discriminator + PubKey + u64
  pub const SIZE: usize = 8 + 32 + 8;
}

#[account]
pub struct TopDonators {
  pub donators: Vec<Donator>,
}

impl TopDonators {
  pub const MAX_DONATORS: usize = 10;
  // Discriminator + Vec + (PubKey + u64) * Donators Amount
  pub const SIZE: usize = 8 + 4 + (32 + 8) * TopDonators::MAX_DONATORS;
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
