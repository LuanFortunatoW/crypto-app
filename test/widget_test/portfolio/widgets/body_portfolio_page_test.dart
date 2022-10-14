import 'package:crypto_app/presenter/pages/portfolio/widgets/body_portifolio_page.dart';
import 'package:crypto_app/presenter/pages/portfolio/widgets/list_view_cryptos.dart';
import 'package:crypto_app/presenter/pages/portfolio/widgets/top_portfolio_page.dart';
import 'package:crypto_app/shared/widgets/default_error_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:network_image_mock/network_image_mock.dart';

import '../../setup_widget_tester.dart';

void main() {
  group(
    'Testing BodyPortfolioPage',
    () {
      testWidgets(
        'WHEN load BodyPortfolioPage THEN ensure return TopPortfolioPage and ListViewCryptos',
        (WidgetTester tester) async {
          await mockNetworkImagesFor(
            () => loadPage(
              tester,
              const BodyPortifolioPage(),
            ),
          );
          final topPortfolioPage = find.byType(TopPortfolioPage);
          final listViewCryptos = find.byType(ListViewCryptos);
          expect(topPortfolioPage, findsOneWidget);

          expect(listViewCryptos, findsOneWidget);
        },
      );

      testWidgets(
        'WHEN load BodyPortfolioPage THEN ensure controllers initialize',
        (WidgetTester tester) async {
          await mockNetworkImagesFor(
            () => loadPageWithoutOverrides(
              tester,
              const BodyPortifolioPage(),
            ),
          );

          final defaultErrorPage = find.byType(DefaultErrorPage);

          expect(defaultErrorPage, findsOneWidget);
        },
      );

      testWidgets(
        'WHEN error BodyPortfolioPage ListViewCryptos THEN ensure return DefaultErrorPage',
        (WidgetTester tester) async {
          await mockNetworkImagesFor(
            () => loadPageError(
              tester,
              const ListViewCryptos(),
            ),
          );

          final listView = find.byType(ListView);
          final defaultErrorPage = find.byType(DefaultErrorPage);

          expect(listView, findsNothing);
          expect(defaultErrorPage, findsOneWidget);

          //Desespero
          await tester.tap(find.byType(MaterialButton));
          await tester.pumpAndSettle();

          expect(listView, findsNothing);
          expect(defaultErrorPage, findsOneWidget);
        },
      );
    },
  );
}
