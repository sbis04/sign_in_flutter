import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:image_test_utils/image_test_utils.dart';

class GoldenTestsUtils {
  static testWidgetWithGolden<T>(
      WidgetTester tester, Widget widgetToTest, String goldenName) async {
    provideMockedNetworkImages(() async {
      await tester.pumpWidget(_makeTestableWidget(child: widgetToTest));
      await expectLater(
        find.byType(T),
        matchesGoldenFile('$goldenName.png'),
        skip: Platform.isLinux,
      );
    });
  }

  static Widget _makeTestableWidget({Widget child}) {
    return MaterialApp(
      home: child,
    );
  }
}
