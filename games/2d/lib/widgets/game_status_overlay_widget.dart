import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:spinnybox_2d/assets.dart';
import 'package:spinnybox_2d/constants.dart';
import 'package:spinnybox_2d/colors.dart';
import 'package:spinnybox_2d/game/game.dart';
import 'package:spinnybox_2d/widgets/widgets.dart';

part 'game_status_overlay_widget.g.dart';

@hcwidget
Widget _gameStatusOverlay(
  BuildContext context, {
  required SpinnyBoxGame game,
  final bool shouldPause = true,
}) {
  final stickyKey = useRef(GlobalKey());
  final score = useValueListenable<int>(game.score);
  final updateGameStatusOverlay = useCallback((duration) {
    final keyContext = stickyKey.value.currentContext;

    if (keyContext == null) {
      return;
    }

    // Widget is visible
    final box = keyContext.findRenderObject() as RenderBox?;
    final offset = box?.localToGlobal(Offset.zero);

    if (box == null || offset == null) {
      return;
    }

    game.statusWidget = StatusOverlayDimensions(size: box.size, offset: offset);
  }, [game]);

  useEffect(() {
    WidgetsBinding.instance.addPostFrameCallback(updateGameStatusOverlay);
    return null;
  }, const []);

  final scoreLabel = WiredLabel(
    fillColor: AppColors.tertiary,
    height: 50,
    width: 150,
    child: Text(
      '$score',
      style: const TextStyle(
        fontFamily: fontFamily,
        fontWeight: FontWeight.w600,
        fontSize: 20,
        letterSpacing: 2,
        color: Colors.white,
      ),
    ),
  );

  final topButtonBar = Row(
    children: <Widget>[
      scoreLabel,
      Expanded(
        child: Padding(
          padding: const EdgeInsets.only(right: 5.0, left: 5.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              if (shouldPause)
                WiredButton.icon(
                  size: 50,
                  icon: const SvgIcon(
                    SvgIconName.pause,
                    color: Colors.white,
                    size: 30,
                  ),
                  fillColor: AppColors.primary,
                  onPressed: () {},
                  tooltip: 'Pause',
                ),
              WiredButton.icon(
                size: 50,
                fillColor: AppColors.tertiary,
                icon: const SvgIcon(
                  SvgIconName.volume,
                  color: Colors.white,
                  size: 30,
                ),
                onPressed: () {
                  // audio.toggleMute();
                },
                tooltip: 'Mute',
              )
            ],
          ),
        ),
      ),
    ],
  );

  return Container(
    key: stickyKey.value,
    padding: const EdgeInsets.only(left: 20, right: 20, top: 20.0),
    child: topButtonBar,
  );
}
