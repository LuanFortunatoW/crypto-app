import 'package:crypto_app/presenter/pages/crypto_info/widgets/buttons_change_days_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../setup_widget_tester.dart';

void main() {
  testWidgets(
    'WHEN tapping ButtonsChangeDaysChart THEN ensure changes focus',
    (tester) async {
      await loadPage(
        tester,
        const ButtonsChangeDaysChart(),
      );

      Text button5d = tester.widget<Text>(
        find.byKey(const Key('5D')),
      );
      Text button15d = tester.widget<Text>(
        find.byKey(const Key('15D')),
      );

      expect(button5d.style!.color, Colors.black);
      expect(button15d.style!.color, Colors.grey);

      await tester.tap(find.text('15D'));
      await tester.pumpAndSettle();

      button5d = tester.widget<Text>(
        find.byKey(const Key('5D')),
      );
      button15d = tester.widget<Text>(
        find.byKey(const Key('15D')),
      );

      expect(button5d.style!.color, Colors.grey);
      expect(button15d.style!.color, Colors.black);
    },
  );
}
