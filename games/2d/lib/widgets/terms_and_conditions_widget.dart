import 'dart:math' show max;

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:spinnybox_2d/colors.dart';
import 'package:spinnybox_2d/constants.dart';
import 'package:spinnybox_2d/models/settings.dart';
import 'package:spinnybox_2d/widgets.dart';

part 'terms_and_conditions_widget.g.dart';

@hcwidget
Widget _termsAndConditions(
  BuildContext context,
  WidgetRef ref,
) {
  final settings = ref.watch(settingsProvider);
  final finishedReadingTerms = useState(false);
  final acceptedTerms = useState(false);
  final scrollController = useScrollController();

  useEffect(() {
    scrollController.addListener(() {
      if (!scrollController.position.atEdge) return;

      final atBottom = scrollController.position.pixels != 0;

      if (!atBottom) return;

      finishedReadingTerms.value = true;
    });

    return () => scrollController.dispose();
  }, [scrollController]);

  final widget = _PopupColumn(
    acceptedTerms: acceptedTerms,
    finishedReadingTerms: finishedReadingTerms,
    scrollController: scrollController,
  );

  // showWiredDialog(context, widget);
  // showDialog<void>(context: context, builder: (context) => const _Example());

  useEffect(() {
    // TODO change this to show dialog only when the user has not accepted the terms.
    if (settings.hasAcceptedTerms || !settings.hasAcceptedTerms) return null;

    // TODO dialog is overflowing the bounds. This should be revisited in the future.
    showWiredDialog(context, widget);

    return () => Navigator.of(context).pop();
  }, [settings.hasAcceptedTerms]);

  useValueChanged(
    settings.hasAcceptedTerms,
    (oldValue, oldResult) {
      if (oldValue || !settings.hasAcceptedTerms) {
        return;
      }

      return Navigator.of(context).pop();
    },
  );

  return const SizedBox.shrink();
}

@hcwidget
Widget __continueButton(
  BuildContext context,
  WidgetRef ref, {
  required bool disabled,
}) {
  final continueButton = WiredButton(
    disabled: disabled,
    onPressed: () {
      // showDialog(context: context, builder: builder)
      ref
          .read(settingsProvider.notifier)
          .update((settings) => settings.copyWith(hasAcceptedTerms: true));
    },
    fillColor: disabled ? AppColors.grey : AppColors.alternative,
    height: 45,
    width: 150,
    child: const Text(
      'Continue',
      style: TextStyle(
        fontFamily: fontFamily,
        fontWeight: FontWeight.w400,
        fontSize: 20,
        letterSpacing: 2,
        height: 0.9,
        color: AppColors.white,
      ),
    ),
  );
  return continueButton;
}

@hcwidget
Widget __popupColumn(
  BuildContext context,
  WidgetRef ref, {
  required ValueNotifier<bool> acceptedTerms,
  required ValueNotifier<bool> finishedReadingTerms,
  required ScrollController scrollController,
}) {
  const termsAndConditionLabel = Text(
    'TERMS & CONDITIONS',
    maxLines: 2,
    textAlign: TextAlign.center,
    style: TextStyle(
      fontFamily: fontFamily,
      fontWeight: FontWeight.bold,
      fontSize: 20,
      letterSpacing: 2,
      height: 1.0,
      color: Colors.black,
    ),
  );

  final textContainer = Expanded(
    child: SingleChildScrollView(
      controller: scrollController,
      child: const MarkdownBody(data: termsAndConditions),
    ),
  );

  final checkBoxRow = Container(
    padding: const EdgeInsets.symmetric(horizontal: 5),
    child: Row(
      children: <Widget>[
        Flexible(
          fit: FlexFit.tight,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 10.0),
            child: WiredCheckbox(
              value: acceptedTerms.value,
              onChanged: (bool? value) => acceptedTerms.value = value ?? false,
            ),
          ),
        ),
        const Flexible(
            flex: 9,
            child: WiredText(
              'I have read and accept these terms and conditions',
              maxLines: 2,
              textAlign: TextAlign.justify,
              fontWeight: FontWeight.w400,
              fontSize: 14,
            ))
      ],
    ),
  );

  final popupColumn = Column(
    children: <Widget>[
      const SizedBox(height: 20),
      termsAndConditionLabel,
      const SizedBox(height: 20),
      textContainer,
      const SizedBox(height: 20),
      checkBoxRow,
      const SizedBox(height: 10),
      _ContinueButton(
        disabled: acceptedTerms.value && finishedReadingTerms.value,
      )
    ],
  );

  return Center(
    child: SizedBox(
      height: max(0.0, MediaQuery.of(context).size.height - 80),
      child: WiredDialog(child: Container(child: popupColumn)),
    ),
  );
}

void showWiredDialog(BuildContext context, Widget widget) {
  showDialog<void>(context: context, builder: (_) => widget);
}

@swidget
Widget __example(BuildContext context) {
  return AlertDialog(
    title: const Text('Basic dialog title'),
    content: const Text('A dialog is a type of modal window that\n'
        'appears in front of app content to\n'
        'provide critical information, or prompt\n'
        'for a decision to be made.'),
    actions: <Widget>[
      TextButton(
        style: TextButton.styleFrom(
          textStyle: Theme.of(context).textTheme.labelLarge,
        ),
        child: const Text('Disable'),
        onPressed: () {
          Navigator.of(context).pop();
        },
      ),
      TextButton(
        style: TextButton.styleFrom(
          textStyle: Theme.of(context).textTheme.labelLarge,
        ),
        child: const Text('Enable'),
        onPressed: () {
          Navigator.of(context).pop();
        },
      ),
    ],
  );
}
