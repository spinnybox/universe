import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:spinnybox_2d/assets.dart';
import 'package:spinnybox_2d/colors.dart';
import 'package:spinnybox_2d/constants.dart';
import 'package:spinnybox_2d/models/settings.dart';
import 'package:spinnybox_2d/screens/router.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';
import 'package:spinnybox_2d/widgets.dart';
import 'package:share_plus/share_plus.dart';

part 'main_screen.g.dart';

@swidget
Widget _mainScreen(BuildContext context) {
  return const MainLayout(child: _MainScreenChild());
}

@hcwidget
Widget __mainScreenChild(
  BuildContext context,
  WidgetRef ref,
) {
  final settings = ref.watch(settingsProvider);

  final ui = Column(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    key: ValueKey(settings.hasAcceptedTerms ? 1 : 2),
    children: const [_StartButton(), _ButtonRow(), _CharacterImage()],
  );

  return Column(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: <Widget>[
      const _TopLogo(),
      Expanded(
        flex: 3,
        child: ui,
      ),
      const TermsAndConditions(),
    ],
  );
}

@swidget
Widget __topLogo(BuildContext context) {
  return Container(
    margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.05),
    child: SvgPicture.asset(
      SvgAsset.logoText,
      height: MediaQuery.of(context).size.height * 0.25,
    ),
  );
}

@swidget
Widget __startButton(BuildContext context) {
  return WiredButton(
    onPressed: () {
      const PlayRoute().go(context);
    },
    height: 75,
    width: MediaQuery.of(context).size.width - 80,
    child: const Text(
      'Start',
      style: TextStyle(
        fontFamily: fontFamily,
        fontWeight: FontWeight.w400,
        fontSize: 35,
        letterSpacing: 2,
        height: 0.9,
        color: AppColors.black,
      ),
    ),
  );
}

/// Used to add vertical space between widgets.
@swidget
Widget __spacerWidget(BuildContext context) {
  return SizedBox(height: MediaQuery.of(context).size.height * 0.02);
}

@swidget
Widget __characterImage(BuildContext context) {
  return SvgPicture.asset(
    SvgAsset.characterDefaultHop,
    width: 200,
  );
}

@swidget
Widget __buttonRow(BuildContext context) {
  final settingsButton = WiredButton.icon(
    onPressed: () {
      const SettingsRoute().go(context);
    },
    fillColor: AppColors.secondary,
    icon: const SvgIcon(
      SvgIconName.settings,
      size: 30,
    ),
    size: 60,
  );

  final shopButton = WiredButton.icon(
    onPressed: () {
      const ShopRoute().go(context);
    },
    fillColor: AppColors.tertiary,
    icon: const SvgIcon(
      SvgIconName.shop,
      size: 30,
    ),
    size: 60,
  );

  final shareButton = WiredButton.icon(
    onPressed: () {
      Share.share('Challenge yourself with SpinnyBox at https://spinnybox.com');
    },
    fillColor: AppColors.primary,
    icon: const SvgIcon(
      SvgIconName.share,
      size: 30,
    ),
    size: 60,
  );

  return SizedBox(
    width: MediaQuery.of(context).size.width - 40,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[settingsButton, shopButton, shareButton],
    ),
  );
}
