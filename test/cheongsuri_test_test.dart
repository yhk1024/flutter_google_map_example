import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:cheongsuri_test/cheongsuri_test.dart';

void main() {
  const MethodChannel channel = MethodChannel('csr_test');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

}
