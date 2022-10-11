import 'package:crypto_app/shared/widgets/button_change_visibility.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../setup_widget_tester.dart';

void main() {
  testWidgets(
    'WHEN tappping ButtonChangeVisibility THEN ensure change visibility',
    (WidgetTester tester) async {
      await loadPage(
        tester,
        const ButtonChangeVisibility(),
      );

      Finder visibility = find.byIcon(Icons.visibility);
      Finder visibilityOff = find.byIcon(Icons.visibility_off);
      expect(visibility, findsOneWidget);
      expect(visibilityOff, findsNothing);

      await tester.tap(find.byType(IconButton));
      await tester.pumpAndSettle();

      visibility = find.byIcon(Icons.visibility);
      visibilityOff = find.byIcon(Icons.visibility_off);
      expect(visibility, findsNothing);
      expect(visibilityOff, findsOneWidget);
    },
  );
}
