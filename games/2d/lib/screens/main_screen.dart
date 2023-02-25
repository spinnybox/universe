import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class MainScreen extends HookWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: const Text(
        'This is the MAIN screen.',
      ),
    );
  }
}
