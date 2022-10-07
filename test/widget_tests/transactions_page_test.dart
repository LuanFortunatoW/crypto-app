import 'package:crypto_app/presenter/pages/transactions/transactions_page.dart';
import 'package:crypto_app/presenter/pages/transactions/widgets/body_transactions_page.dart';
import 'package:crypto_app/presenter/pages/transactions/widgets/list_tile_transactions.dart';
import 'package:crypto_app/presenter/pages/transactions/widgets/list_view_transacitons.dart';
import 'package:crypto_app/shared/widgets/bottom_navigation_bar_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../default_models.dart';
import '../setup_widget_tester.dart';

void main() {
  group(
    'Testing Transactions Page',
    () {
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
      testWidgets(
        'WHEN load BodyTransactionsPage THEN ensure return Text, Divider and ListViewTransacitons',
        (tester) async {
          await loadPage(tester, const BodyTransactionsPage());

          final text = find.byType(Text);
          final divider = find.byType(Divider);
          final listViewTransacitons = find.byType(ListViewTransacitons);

          expect(text, findsOneWidget);
          expect(divider, findsOneWidget);
          expect(listViewTransacitons, findsOneWidget);
        },
      );
      testWidgets(
        'WHEN load ListViewTransacitons THEN ensure return ListView.separated',
        (tester) async {
          await loadPage(
            tester,
            const ListViewTransacitons(),
          );

          final listView = find.byType(ListView);

          expect(listView, findsOneWidget);
        },
      );
      testWidgets(
        'WHEN load ListTileTransactions THEN ensure return Texts',
        (tester) async {
          await loadPage(
            tester,
            ListTileTransactions(
              conversion: DefaultModels.conversionEntity,
            ),
          );

          final text = find.text(
            '${DefaultModels.conversionEntity.quantity} ${DefaultModels.conversionEntity.convertedCrypto.symbol.toUpperCase()}',
          );
          final texts = find.byType(Text);

          expect(text, findsOneWidget);
          expect(texts, findsNWidgets(4));
        },
      );
    },
  );
}
