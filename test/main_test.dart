import 'package:flutter_test/flutter_test.dart';
import 'package:sign_in_flutter/main.dart';

import 'golden_tests_utils.dart';

void main() {
  testWidgets(
      'Main app golden test',
      (WidgetTester tester) async =>
          GoldenTestsUtils.testWidgetWithGolden<MyApp>(
              tester, MyApp(), 'main_app_golden_test'));
}
