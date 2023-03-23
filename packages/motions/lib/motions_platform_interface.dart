import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'motions_method_channel.dart';

abstract class MotionsPlatform extends PlatformInterface {
  /// Constructs a MotionsPlatform.
  MotionsPlatform() : super(token: _token);

  static final Object _token = Object();

  static MotionsPlatform _instance = MethodChannelMotions();

  /// The default instance of [MotionsPlatform] to use.
  ///
  /// Defaults to [MethodChannelMotions].
  static MotionsPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [MotionsPlatform] when
  /// they register themselves.
  static set instance(MotionsPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
