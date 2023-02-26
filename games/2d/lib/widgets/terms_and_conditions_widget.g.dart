// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'terms_and_conditions_widget.dart';

// **************************************************************************
// FunctionalWidgetGenerator
// **************************************************************************

class TermsAndConditions extends HookConsumerWidget {
  const TermsAndConditions({Key? key}) : super(key: key);

  @override
  Widget build(
    BuildContext _context,
    WidgetRef _ref,
  ) =>
      _termsAndConditions(
        _context,
        _ref,
      );
}

class _ContinueButton extends HookConsumerWidget {
  const _ContinueButton({
    Key? key,
    required this.disabled,
  }) : super(key: key);

  final bool disabled;

  @override
  Widget build(
    BuildContext _context,
    WidgetRef _ref,
  ) =>
      __continueButton(
        _context,
        _ref,
        disabled: disabled,
      );
}

class _PopupColumn extends HookConsumerWidget {
  const _PopupColumn({
    Key? key,
    required this.acceptedTerms,
    required this.finishedReadingTerms,
    required this.scrollController,
  }) : super(key: key);

  final ValueNotifier<bool> acceptedTerms;

  final ValueNotifier<bool> finishedReadingTerms;

  final ScrollController scrollController;

  @override
  Widget build(
    BuildContext _context,
    WidgetRef _ref,
  ) =>
      __popupColumn(
        _context,
        _ref,
        acceptedTerms: acceptedTerms,
        finishedReadingTerms: finishedReadingTerms,
        scrollController: scrollController,
      );
}
