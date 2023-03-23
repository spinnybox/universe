import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:motions/motions_method_channel.dart';

void main() {
  MethodChannelMotions platform = MethodChannelMotions();
  const MethodChannel channel = MethodChannel('motions');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await platform.getPlatformVersion(), '42');
  });
}
