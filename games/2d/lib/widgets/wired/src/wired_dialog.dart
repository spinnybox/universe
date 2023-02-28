import 'package:flutter/material.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';
import 'package:spinnybox_2d/widgets/wired/rough/rough.dart';
import 'wired_base.dart';

import 'canvas/wired_canvas.dart';

part 'wired_dialog.g.dart';

/// Wired dialog.
///
/// Usage:
/// ```dart
/// WiredButton(
/// 	onPressed: () {
/// 	  showDialog(
/// 		context: context,
/// 		builder: (context) {
/// 		  return Center(
/// 			child: Container(
/// 			  height: 480.0,
/// 			  child: WiredDialog(
/// 				child: Column(
/// 				  crossAxisAlignment: CrossAxisAlignment.start,
/// 				  children: [
/// 					WiredText(
/// 					  'Title',
/// 					  fontSize: 20.0,
/// 					  fontWeight: FontWeight.bold,
/// 					),
/// 					SizedBox(height: 15.0),
/// 					WiredText(
/// 					  'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.',
/// 					),
/// 					SizedBox(height: 15.0),
/// 					Row(
/// 					  mainAxisAlignment: MainAxisAlignment.end,
/// 					  children: [
/// 						WiredButton(
/// 						  child: Text('OK'),
/// 						  onPressed: () {
/// 							Navigator.of(context).pop();
/// 						  },
/// 						),
/// 					  ],
/// 					),
/// 				  ],
/// 				),
/// 			  ),
/// 			),
/// 		  );
/// 		},
/// 	  );
/// 	},
/// 	child: WiredText('Open wired dialog'),
///   ),
/// ```
@swidget
Widget _wiredDialog(
  BuildContext context, {
  /// The content in dialog.
  required Widget child,
  double? width,
  double? height,

  /// The padding for dialog's content, defaults to 20.0 if null.
  EdgeInsetsGeometry? padding,
  Color fillColor = Colors.white,
  RoughFilter fillerType = RoughFilter.noFiller,
}) {
  width = width ?? MediaQuery.of(context).size.width * 0.8;
  height = height ?? MediaQuery.of(context).size.height * 0.8;

  return Dialog(
    child: Stack(
      children: [
        Padding(
          padding: const EdgeInsets.all(5.0),
          child: WiredCanvas(
            painter: WiredRectangleBase(fillColor: fillColor),
            fillerType: fillerType,
            size: Size(width, height),
          ),
        ),
        Padding(
          padding: padding ?? const EdgeInsets.all(20.0),
          child: child,
        ),
      ],
    ),
  );
}
