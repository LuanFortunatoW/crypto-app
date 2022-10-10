import 'package:crypto_app/presenter/pages/convert_%20currency/convert_currency_page.dart';
import 'package:crypto_app/presenter/pages/crypto_info/crypto_info_page.dart';
import 'package:crypto_app/presenter/pages/crypto_info/widgets/body_info_page.dart';
import 'package:crypto_app/presenter/pages/crypto_info/widgets/button_convert_currency.dart';
import 'package:crypto_app/presenter/pages/crypto_info/widgets/buttons_change_days_chart.dart';
import 'package:crypto_app/presenter/pages/crypto_info/widgets/crypto_info_chart.dart';
import 'package:crypto_app/shared/widgets/divider_crypto_info.dart';
import 'package:crypto_app/presenter/pages/crypto_info/widgets/row_crypto_infos.dart';
import 'package:crypto_app/presenter/pages/crypto_info/widgets/row_crypto_monetary_info.dart';
import 'package:crypto_app/presenter/pages/crypto_info/widgets/title_crypto_price.dart';
import 'package:crypto_app/shared/widgets/default_error_page.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:network_image_mock/network_image_mock.dart';

import '../default_models.dart';
import '../setup_widget_tester.dart';

void main() {
  setUpAll(() {
    registerFallbackValue(FakeRoute());
  });

  group(
    'Testing crypto info page',
    () {
      testWidgets(
        'WHEN load PortfolioPage THEN ensure return AppBar and BodyInfoPage',
        (tester) async {
          await mockNetworkImagesFor(
            () => loadPage(
              tester,
              CryptoInfoPage(args: DefaultModels.cryptoInfoArgs),
            ),
          );

          final appBar = find.byType(AppBar);
          final bodyInfoPage = find.byType(BodyInfoPage);

          expect(appBar, findsOneWidget);
          expect(bodyInfoPage, findsOneWidget);
        },
      );

      testWidgets(
        'WHEN load BodyInfoPage THEN ensure return RowCryptoInfos, CryptoInfoChart, DividerCryptoInfo, RowCryptoMonetaryInfo and ButtonConvertCurrency',
        (tester) async {
          await mockNetworkImagesFor(
            () => loadPage(
              tester,
              BodyInfoPage(args: DefaultModels.cryptoInfoArgs),
            ),
          );

          final rowCryptoInfos = find.byType(RowCryptoInfos);
          final cryptoInfoChart = find.byType(CryptoInfoChart);
          final dividerCryptoInfo = find.byType(DividerCryptoInfo);
          final rowCryptoMonetaryInfo = find.byType(RowCryptoMonetaryInfo);
          final buttonConvertCurrency = find.byType(ButtonConvertCurrency);

          expect(rowCryptoInfos, findsOneWidget);
          expect(cryptoInfoChart, findsOneWidget);
          expect(dividerCryptoInfo, findsNWidgets(4));
          expect(rowCryptoMonetaryInfo, findsNWidgets(4));
          expect(buttonConvertCurrency, findsOneWidget);
        },
      );
      testWidgets(
        'WHEN load RowCryptoInfos THEN ensure return Texts and CircleAvatar',
        (tester) async {
          await loadPage(
            tester,
            RowCryptoInfos(walletCryptoEntity: DefaultModels.walletModelBTC),
          );

          final texts = find.byType(Text);
          final circleAvatar = find.byType(CircleAvatar);

          expect(texts, findsNWidgets(2));
          expect(circleAvatar, findsOneWidget);
        },
      );

      testWidgets(
        'WHEN load CryptoInfoChart THEN ensure return LineChart, TitleCryptoPrice, and ButtonsChangeDaysChart ',
        (tester) async {
          await loadPage(
            tester,
            CryptoInfoChart(args: DefaultModels.cryptoInfoArgs),
          );

          final lineChart = find.byType(LineChart);
          final titleCryptoPrice = find.byType(TitleCryptoPrice);
          final buttonsChangeDaysChart = find.byType(ButtonsChangeDaysChart);
          final defaultErrorPage = find.byType(DefaultErrorPage);

          if (!lineChart.precache()) {
            expect(lineChart, findsNothing);
            expect(buttonsChangeDaysChart, findsNothing);
            expect(titleCryptoPrice, findsNothing);
            expect(defaultErrorPage, findsOneWidget);
          } else {
            expect(lineChart, findsOneWidget);
            expect(buttonsChangeDaysChart, findsOneWidget);
            expect(titleCryptoPrice, findsOneWidget);
            expect(defaultErrorPage, findsNothing);
          }
        },
      );

      testWidgets(
        'WHEN load TitleCryptoPrice THEN ensure return Text',
        (tester) async {
          await loadPage(tester, const TitleCryptoPrice());

          final text = find.byType(Text);

          expect(text, findsOneWidget);
        },
      );

      testWidgets(
        'WHEN load TitleCryptoPrice THEN ensure return Text',
        (tester) async {
          await loadPage(tester, const ButtonsChangeDaysChart());

          final listView = find.byType(ListView);
          final inkWell = find.byType(InkWell);

          expect(listView, findsOneWidget);
          expect(inkWell, findsAtLeastNWidgets(4));
        },
      );

      testWidgets(
        'WHEN load RowCryptoMonetaryInfo THEN ensure return Texts',
        (tester) async {
          const label = 'price';
          const text = '0.00';

          await loadPage(
            tester,
            const RowCryptoMonetaryInfo(
              color: Colors.white,
              label: label,
              text: text,
            ),
          );

          final texts = find.byType(Text);

          expect(texts, findsAtLeastNWidgets(2));
        },
      );

      testWidgets(
        'WHEN click ButtonConvertCurrency THEN ensure Navigates to convert_currency',
        (tester) async {
          final mockNavigatorObserver = MockNavigatorObserver();
          await loadPageObserver(
            tester,
            ButtonConvertCurrency(
              walletCryptoEntity: DefaultModels.walletModelBTC,
            ),
            [mockNavigatorObserver],
          );

          await tester.tap(find.byType(ButtonConvertCurrency));
          await tester.pumpAndSettle();

          verify(() => mockNavigatorObserver.didPush(any(), any()));

          expect(find.byType(ConvertCurrencyPage), findsOneWidget);
        },
      );
    },
  );
}
