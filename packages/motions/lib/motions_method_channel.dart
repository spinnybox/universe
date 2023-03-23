import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'motions_platform_interface.dart';

/// An implementation of [MotionsPlatform] that uses method channels.
class MethodChannelMotions extends MotionsPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('motions');

  @override
  Future<String?> getPlatformVersion() async {
    final version =
        await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
