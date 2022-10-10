import 'package:crypto_app/presenter/pages/portfolio/portfolio_page.dart';
import 'package:crypto_app/presenter/pages/transactions/transactions_page.dart';
import 'package:crypto_app/shared/widgets/bottom_navigation_bar_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../setup_widget_tester.dart';

void main() {
  setUpAll(() {
    registerFallbackValue(FakeRoute());
  });
  group(
    'Testing the Bottom NavigationBar',
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
      testWidgets(
        'WHEN click BottomNavigationBarItem THEN ensure Navigates to Transactions Page',
        (tester) async {
          final mockNavigatorObserver = MockNavigatorObserver();
          await loadPageObserver(
            tester,
            const BottomNavigationBarApp(),
            [mockNavigatorObserver],
          );

          Finder bottomNavigationBarItem = find.byType(ImageIcon);

          await tester.tap(bottomNavigationBarItem.last);
          await tester.pumpAndSettle();

          verify(() => mockNavigatorObserver.didPush(any(), any()));

          expect(find.byType(TransactionsPage), findsOneWidget);

        },
      );
      testWidgets(
        'WHEN click BottomNavigationBarItem THEN ensure Navigates to PortfolioPage',
        (tester) async {
          final mockNavigatorObserver = MockNavigatorObserver();
          await loadPageObserver(
            tester,
            const BottomNavigationBarApp(),
            [mockNavigatorObserver],
          );

          Finder bottomNavigationBarItem = find.byType(ImageIcon);

          await tester.tap(bottomNavigationBarItem.first);
          await tester.pumpAndSettle();

          verify(() => mockNavigatorObserver.didPush(any(), any()));

          expect(find.byType(PortfolioPage), findsOneWidget);

        },
      );
    },
  );
}
