
import 'motions_platform_interface.dart';

class Motions {
  Future<String?> getPlatformVersion() {
    return MotionsPlatform.instance.getPlatformVersion();
  }
}
