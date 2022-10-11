import 'package:crypto_app/presenter/pages/conversion_review/conversion_review_page.dart';
import 'package:crypto_app/presenter/pages/convert_%20currency/convert_currency_page.dart';
import 'package:crypto_app/presenter/pages/convert_%20currency/widgets/body_convert_currency.dart';
import 'package:crypto_app/presenter/pages/convert_%20currency/widgets/bottom_sheet_amout_to_convert.dart';
import 'package:crypto_app/presenter/pages/convert_%20currency/widgets/button_select_currency.dart';
import 'package:crypto_app/shared/widgets/app_bar_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:network_image_mock/network_image_mock.dart';

import '../../fake_repository/default_models.dart';
import '../setup_widget_tester.dart';

void main() {
  setUpAll(() {
    registerFallbackValue(FakeRoute());
  });
  group(
    'Testing Convert currency page',
    () {
      testWidgets(
        'WHEN load ConvertCurrencyPage THEN ensure return AppBar, BodyConvertCurrencyPage and BottomSheetAmountToConvert',
        (tester) async {
          await mockNetworkImagesFor(
            () => loadPage(
              tester,
              ConvertCurrencyPage(args: DefaultModels.convertCurrencyArgs),
            ),
          );

          final appBar = find.byType(AppBarApp);
          final bodyConvertCurrencyPage = find.byType(BodyConvertCurrencyPage);
          final bottomSheetAmountToConvert =
              find.byType(BottomSheetAmountToConvert);

          expect(appBar, findsOneWidget);
          expect(bodyConvertCurrencyPage, findsOneWidget);
          expect(bottomSheetAmountToConvert, findsOneWidget);
        },
      );

      testWidgets(
        'WHEN click FloatingActionButton THEN ensure Navigates when valid',
        (tester) async {
          final mockNavigationObserver = MockNavigatorObserver();
          await mockNetworkImagesFor(
            () => loadPageObserver(
              tester,
              ConvertCurrencyPage(args: DefaultModels.convertCurrencyArgs),
              [mockNavigationObserver],
            ),
          );

          final textField = find.byType(TextField);
          final showModalBottomSheetButtonRigth =
              find.byType(ButtonSelectCurrency).last;
          final floatingActionButton = find.byType(FloatingActionButton);

          await tester.tap(floatingActionButton);
          await tester.pumpAndSettle();

          expect(find.byType(ConversionReviewPage), findsNothing);

          await tester.enterText(textField, '0,05');
          await tester.pumpAndSettle();

          await tester.tap(showModalBottomSheetButtonRigth);
          await tester.pumpAndSettle();

          final listTileCrypto = find.byType(ListTile).last;

          await tester.tap(listTileCrypto);
          await tester.pumpAndSettle();

          await tester.tap(floatingActionButton);
          await tester.pumpAndSettle();

          verify(() => mockNavigationObserver.didPush(any(), any()));

          expect(find.byType(ConversionReviewPage), findsOneWidget);
        },
      );
    },
  );
}
