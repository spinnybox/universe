import 'package:flutter_test/flutter_test.dart';
import 'package:motions/motions.dart';
import 'package:motions/motions_platform_interface.dart';
import 'package:motions/motions_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockMotionsPlatform
    with MockPlatformInterfaceMixin
    implements MotionsPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final MotionsPlatform initialPlatform = MotionsPlatform.instance;

  test('$MethodChannelMotions is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelMotions>());
  });

  test('getPlatformVersion', () async {
    Motions motionsPlugin = Motions();
    MockMotionsPlatform fakePlatform = MockMotionsPlatform();
    MotionsPlatform.instance = fakePlatform;

    expect(await motionsPlugin.getPlatformVersion(), '42');
  });
}
