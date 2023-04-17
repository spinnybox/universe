import 'package:flutter/cupertino.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';

part 'custom_reveal_widget.g.dart';

@hwidget
Widget _customReveal(
  BuildContext context, {
  required Animation<double> animation,
  required Color color,
  required Widget child,
}) {
  final tween = useRef(Tween(begin: const Offset(0, -1), end: Offset.zero));
  final finished = useState(false);
  final statusListener = useCallback(
    (AnimationStatus status) {
      if (status == AnimationStatus.completed) {
        finished.value = true;
        return;
      }

      finished.value = false;
    },
    const [],
  );

  useEffect(
    () {
      animation.addStatusListener(statusListener);
      return () => animation.removeStatusListener(statusListener);
    },
    [animation, statusListener],
  );

  return Stack(
    fit: StackFit.expand,
    children: [
      SlideTransition(
        position: tween.value.animate(
          CurvedAnimation(
            parent: animation,
            curve: Curves.easeOutCubic,
            reverseCurve: Curves.easeOutCubic,
          ),
        ),
        child: Container(color: color),
      ),
      AnimatedOpacity(
        opacity: finished.value ? 1 : 0,
        duration: const Duration(milliseconds: 300),
        child: child,
      ),
    ],
  );
}
