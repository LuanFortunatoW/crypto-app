import 'package:crypto_app/presenter/pages/transactions/transactions_page.dart';
import 'package:crypto_app/presenter/pages/transactions/widgets/body_transactions_page.dart';
import 'package:crypto_app/shared/widgets/bottom_navigation_bar_app.dart';
import 'package:flutter_test/flutter_test.dart';

import '../setup_widget_tester.dart';

void main() {
  testWidgets(
    'WHEN load TransactionsPage THEN ensure return BodyTransactionsPage and BottomNavigationBarApp',
    (tester) async {
      await loadPage(tester, const TransactionsPage());

      final bodyTransactionsPage = find.byType(BodyTransactionsPage);
      final bottomNavigationBarApp = find.byType(BottomNavigationBarApp);

      expect(bodyTransactionsPage, findsOneWidget);
      expect(bottomNavigationBarApp, findsOneWidget);
    },
  );
}
