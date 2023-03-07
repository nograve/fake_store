import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import 'package:fake_store/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('End to end app testing', () {
    testWidgets(
        'Login wirh correct user credentials, should navigate to home page',
        (tester) async {
      app.main();
      await tester.pumpAndSettle();
      await tester.tap(find.byKey(const Key('username_field')));
      await tester.pumpAndSettle();
      await tester.enterText(
          find.byKey(const Key('username_field')), 'mor_2314');
      await tester.pumpAndSettle();
      await tester.tap(find.byKey(const Key('password_field')));
      await tester.pumpAndSettle();
      await tester.enterText(find.byKey(const Key('password_field')), '83r5^_');
      await tester.pumpAndSettle();
      await tester.tap(find.byKey(const Key('submit_button')));
      await tester.pumpAndSettle();
      expect(find.byKey(const Key('home_view')), findsOneWidget);
    });
  });
}
