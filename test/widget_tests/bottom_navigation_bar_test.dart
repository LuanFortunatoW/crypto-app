import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../setup_widget_tester.dart';

void main() {
  group(
    'Testin the Bottom NavigationBar',
    () {
      testWidgets(
        'WHEN load BottomNavigationBarItem THEN ensure return label and icon',
        (tester) async {
          const label = 'test';
          const icon = Icon(Icons.check);

          await loadPage(
            tester,
            BottomNavigationBar(
              items: const [
                BottomNavigationBarItem(
                  label: label,
                  icon: icon,
                ),
                BottomNavigationBarItem(
                  label: label,
                  icon: icon,
                ),
              ],
            ),
          );

          final bottomNavigationBarItemLabel = tester
              .widget<BottomNavigationBar>(find.byType(BottomNavigationBar))
              .items
              .first
              .label;
          final bottomNavigationBarItemIcon = tester
              .widget<BottomNavigationBar>(find.byType(BottomNavigationBar))
              .items
              .first
              .icon;

          expect(bottomNavigationBarItemLabel, label);
          expect(bottomNavigationBarItemIcon, icon);
        },
      );
    },
  );
}
