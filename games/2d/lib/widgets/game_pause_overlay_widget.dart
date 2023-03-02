import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:spinnybox_2d/assets.dart';
import 'package:spinnybox_2d/colors.dart';
import 'package:spinnybox_2d/constants.dart';
import 'package:spinnybox_2d/game/game.dart';
import 'package:spinnybox_2d/screens/router.dart';
import 'package:spinnybox_2d/widgets.dart';

part 'game_pause_overlay_widget.g.dart';

@hcwidget
Widget _gamePauseOverlay(
  BuildContext context,
  WidgetRef ref, {
  required SpinnyBoxGame game,
  String message = 'Do you want to get started?',
  String playMessage = 'Resume',
  String exitMessage = 'Exit',
}) {
  final score = useValueListenable(game.score);

  final width = MediaQuery.of(context).size.width;

  final resumeButton = WiredButton(
    onPressed: () {},
    fillColor: AppColors.primary,
    height: 60,
    width: width * 0.6,
    child: Text(
      playMessage,
      style: const TextStyle(
        fontFamily: fontFamily,
        fontWeight: FontWeight.w400,
        fontSize: 35,
        letterSpacing: 2,
        height: 0.9,
        color: Colors.white,
      ),
    ),
  );

  final exitButton = WiredButton(
    onPressed: () {
      game.exit();
      const MainRoute().go(context);
    },
    fillColor: AppColors.secondary,
    height: 60,
    width: width * 0.6,
    child: Text(
      exitMessage,
      style: const TextStyle(
        fontFamily: fontFamily,
        fontWeight: FontWeight.w400,
        fontSize: 35,
        letterSpacing: 2,
        height: 0.9,
        color: Colors.white,
      ),
    ),
  );

  const gamePausedLabel = Text(
    'Game \n Paused',
    maxLines: 2,
    textAlign: TextAlign.center,
    style: TextStyle(
      fontFamily: fontFamily,
      fontWeight: FontWeight.w400,
      fontSize: 50,
      letterSpacing: 2,
      height: 1.0,
      color: Colors.black,
    ),
  );

  final columnButton = Align(
    child: Column(
      children: <Widget>[
        const SizedBox(
          height: 50.0,
        ),
        gamePausedLabel,
        const SizedBox(
          height: 40.0,
        ),
        resumeButton,
        const SizedBox(
          height: 20.0,
        ),
        exitButton
      ],
    ),
  );

  final pauseBackground = Container(
    padding: const EdgeInsets.only(top: 20),
    child: WiredDialog(
      width: width * 0.8,
      height: width * 1.1,
      child: columnButton,
    ),
  );

  final scoreLabel = WiredLabel(
    height: 50,
    width: 150,
    child: Text(
      '$score',
      textAlign: TextAlign.center,
      style: const TextStyle(
        fontFamily: fontFamily,
        fontWeight: FontWeight.w400,
        fontSize: 25,
        letterSpacing: 2,
        color: AppColors.black,
      ),
    ),
  );

  final soundButton = WiredButton.icon(
    onPressed: () {
      // audio.toggleMute();
    },
    fillColor: AppColors.alternative,
    icon: const SvgIcon(
      SvgIconName.volume,
      color: Colors.white,
      size: 30,
    ),
    size: 50,
  );

  final rowAppbar = Container(
    height: 60,
    margin: const EdgeInsets.only(left: 20, right: 20.0, top: 15.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        scoreLabel,
        soundButton,
      ],
    ),
  );

  return Scaffold(
    backgroundColor: Colors.transparent,
    body: Stack(
      children: <Widget>[
        Material(
          elevation: 10.0,
          color: Colors.black12,
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: SafeArea(
              child: Column(
                children: <Widget>[rowAppbar, pauseBackground],
              ),
            ),
          ),
        )
      ],
    ),
  );
}
