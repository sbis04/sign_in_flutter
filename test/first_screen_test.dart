import 'package:flutter_test/flutter_test.dart';

import '../lib/first_screen.dart';
import 'golden_tests_utils.dart';

void main() {
  //Golden test (snapshot test)
  testWidgets(
      'First screen golden test',
      (WidgetTester tester) async =>
          GoldenTestsUtils.testWidgetWithGolden<FirstScreen>(
              tester, FirstScreen(), 'first_screen_golden'));
}
