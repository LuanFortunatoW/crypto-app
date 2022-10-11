import 'package:crypto_app/presenter/pages/crypto_info/crypto_info_page.dart';
import 'package:crypto_app/presenter/pages/portfolio/portfolio_page.dart';
import 'package:crypto_app/presenter/pages/portfolio/widgets/body_portifolio_page.dart';
import 'package:crypto_app/presenter/pages/portfolio/widgets/crypto_infos_in_tile.dart';
import 'package:crypto_app/presenter/pages/portfolio/widgets/list_tile_crypto.dart';
import 'package:crypto_app/presenter/pages/portfolio/widgets/list_view_cryptos.dart';
import 'package:crypto_app/presenter/pages/portfolio/widgets/monetary_infos_crypto_in_tile.dart';
import 'package:crypto_app/presenter/pages/portfolio/widgets/top_portfolio_page.dart';
import 'package:crypto_app/presenter/pages/portfolio/widgets/total_wallet_value.dart';
import 'package:crypto_app/shared/widgets/bottom_navigation_bar_app.dart';
import 'package:crypto_app/shared/widgets/button_change_visibility.dart';
import 'package:crypto_app/shared/widgets/default_error_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:network_image_mock/network_image_mock.dart';

import '../default_models.dart';
import '../setup_widget_tester.dart';

void main() {
  setUpAll(
    () {
      registerFallbackValue(FakeRoute());
    },
  );

  group(
    'Testing portfolio page',
    () {
      testWidgets(
        'WHEN load PortfolioPage THEN ensure return BodyPortfolioPage and BottomNavigationBarApp',
        (WidgetTester tester) async {
          await mockNetworkImagesFor(
            () => loadPage(
              tester,
              const PortfolioPage(),
            ),
          );
          final bodyPortifolioPage = find.byType(BodyPortifolioPage);
          final bottomNavigationBarApp = find.byType(BottomNavigationBarApp);
          expect(bodyPortifolioPage, findsOneWidget);
          expect(bottomNavigationBarApp, findsOneWidget);
        },
      );

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
        'WHEN load TopPortfolioPage THEN ensure return Texts, TotalWalletValue and ButtonChangeVisibility',
        (WidgetTester tester) async {
          await mockNetworkImagesFor(
            () => loadPage(
              tester,
              const TopPortfolioPage(),
            ),
          );

          final totalWalletValue = find.byType(TotalWalletValue);
          final buttonChangeVisibility = find.byType(ButtonChangeVisibility);
          final texts = find.byType(Text);

          expect(totalWalletValue, findsOneWidget);
          expect(buttonChangeVisibility, findsOneWidget);
          expect(texts, findsNWidgets(3));
        },
      );

      testWidgets(
        'WHEN load ListViewCryptos THEN ensure return ListView',
        (WidgetTester tester) async {
          await mockNetworkImagesFor(
            () => loadPage(
              tester,
              const ListViewCryptos(),
            ),
          );

          final listView = find.byType(ListView);
          final defaultErrorPage = find.byType(DefaultErrorPage);

          if (!listView.precache()) {
            expect(listView, findsNothing);
            expect(defaultErrorPage, findsOneWidget);
          } else {
            expect(listView, findsOneWidget);
            expect(defaultErrorPage, findsNothing);
          }
        },
      );

      testWidgets(
        'WHEN load ListTileCrypto THEN ensure return CryptoInfosInTile and MonetaryInfosCryptoInTile',
        (WidgetTester tester) async {
          await mockNetworkImagesFor(
            () => loadPage(
              tester,
              ListTileCrypto(walletCryptoEntity: DefaultModels.walletModelBTC),
            ),
          );
          final monetaryInfosCryptoInTile =
              find.byType(MonetaryInfosCryptoInTile);
          final cryptoInfosInTile = find.byType(CryptoInfosInTile);
          expect(monetaryInfosCryptoInTile, findsOneWidget);
          expect(cryptoInfosInTile, findsOneWidget);
        },
      );
      testWidgets(
        'WHEN click ListTileCrypto THEN ensure navigates',
        (WidgetTester tester) async {
          final mockNavigationObserver = MockNavigatorObserver();
          await mockNetworkImagesFor(
            () => loadPageObserver(
              tester,
              ListTileCrypto(walletCryptoEntity: DefaultModels.walletModelBTC),
              [mockNavigationObserver],
            ),
          );

          await tester.tap(find.byType(ListTileCrypto));
          await tester.pumpAndSettle();

          verify(() => mockNavigationObserver.didPush(any(), any()));

          expect(find.byType(CryptoInfoPage), findsOneWidget);
        },
      );

      testWidgets(
        'WHEN load CryptoInfosInTile THEN ensure return CircleAvatar and Texts',
        (WidgetTester tester) async {
          await mockNetworkImagesFor(
            () => loadPage(
              tester,
              CryptoInfosInTile(
                  walletCryptoEntity: DefaultModels.walletModelBTC),
            ),
          );
          final circleAvatar = find.byType(CircleAvatar);
          final texts = find.byType(Text);
          expect(circleAvatar, findsOneWidget);
          expect(texts, findsNWidgets(2));
        },
      );
      testWidgets(
        'WHEN load MonetaryInfosCryptoInTile THEN ensure return Texts',
        (WidgetTester tester) async {
          await loadPage(
            tester,
            MonetaryInfosCryptoInTile(
                walletCryptoEntity: DefaultModels.walletModelBTC),
          );
          final texts = find.byType(Text);
          expect(texts, findsNWidgets(2));
        },
      );

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
    },
  );
}
