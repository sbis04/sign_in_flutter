import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sign_in_flutter/login_page.dart';

import 'golden_tests_utils.dart';

void main() {
  Widget makeTestableWidget({Widget child}) {
    return MaterialApp(
      home: child,
    );
  }

  testWidgets('Login screen test', (WidgetTester tester) async {
    LoginPage loginScreen = LoginPage();

    await tester.pumpWidget(makeTestableWidget(child: loginScreen));

    expect(find.byType(FlutterLogo), findsOneWidget);
    expect(find.byType(OutlineButton), findsOneWidget);
    expect(find.text('Sign in with Google'), findsOneWidget);

    print('Found Flutter logo.');
    print('Button found.');
    print('Found the login button text.');
  });

  //Golden test (snapshot test)
  testWidgets(
      'Login screen golden test',
      (WidgetTester tester) async =>
          GoldenTestsUtils.testWidgetWithGolden<LoginPage>(
              tester, LoginPage(), 'login_page_golden'));
}
