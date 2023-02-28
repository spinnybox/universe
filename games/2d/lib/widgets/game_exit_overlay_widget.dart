import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:spinnybox_2d/assets.dart';
import 'package:spinnybox_2d/colors.dart';
import 'package:spinnybox_2d/constants.dart';
import 'package:spinnybox_2d/game/game.dart';
import 'package:spinnybox_2d/screens/router.dart';
import 'package:spinnybox_2d/widgets/widgets.dart';

part 'game_exit_overlay_widget.g.dart';

@hcwidget
Widget _gameOverOverlay(
  BuildContext context, {
  required SpinnyBoxGame game,
  String message = '',
  String playMessage = 'Resume',
  String exitMessage = 'Exit',
}) {
  final score = useValueListenable(game.score);

  final resumeButton = WiredButton(
    onPressed: () {},
    fillColor: AppColors.primary,
    height: 60,
    width: MediaQuery.of(context).size.width * 0.6,
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
    width: MediaQuery.of(context).size.width * 0.6,
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
    'Game \n Over',
    maxLines: 2,
    textAlign: TextAlign.center,
    style: TextStyle(
      fontFamily: fontFamily,
      fontWeight: FontWeight.bold,
      fontSize: 50,
      letterSpacing: 2,
      height: 1.0,
      color: Colors.black,
    ),
  );

  final scoreLabel = Text(
    'Score \n $score',
    maxLines: 2,
    textAlign: TextAlign.center,
    style: const TextStyle(
      fontFamily: fontFamily,
      fontWeight: FontWeight.w400,
      fontSize: 35,
      letterSpacing: 2,
      height: 1.0,
      color: AppColors.black,
    ),
  );

  final columnButton = Align(
    child: Column(
      children: <Widget>[
        const SizedBox(height: 50.0),
        gamePausedLabel,
        const SizedBox(height: 10.0),
        scoreLabel,
        const SizedBox(height: 20.0),
        resumeButton,
        const SizedBox(height: 20.0),
        exitButton
      ],
    ),
  );

  final pausedBackground = Stack(
    children: <Widget>[
      Container(
        margin: const EdgeInsets.only(top: 5.0),
        decoration: BoxDecoration(
            color: Colors.white60, borderRadius: BorderRadius.circular(20.0)),
        width: MediaQuery.of(context).size.width * 0.8 + 10,
        height: MediaQuery.of(context).size.height * 0.55 + 10,
      ),
      Container(
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(20.0)),
        width: MediaQuery.of(context).size.width * 0.8,
        height: MediaQuery.of(context).size.height * 0.55,
        child: Align(
          child: Stack(
            children: <Widget>[columnButton],
          ),
        ),
      )
    ],
  );

  const scoreButton = SizedBox(height: 60, width: 150);

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

  final appbarRow = Container(
    height: 60,
    margin: const EdgeInsets.only(left: 20, right: 20.0, top: 20.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[scoreButton, soundButton],
    ),
  );

  final mainColumn = Column(
    children: <Widget>[
      appbarRow,
      const SizedBox(height: 40.0),
      pausedBackground
    ],
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
            child: mainColumn,
          ),
        )
      ],
    ),
  );
}
