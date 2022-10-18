import 'package:crypto_app/presenter/pages/convert_%20currency/widgets/body_convert_currency.dart';
import 'package:crypto_app/presenter/pages/convert_%20currency/widgets/column_text_field_quantity.dart';
import 'package:crypto_app/presenter/pages/convert_%20currency/widgets/container_info_balance_amount.dart';
import 'package:crypto_app/presenter/pages/convert_%20currency/widgets/page_title.dart';
import 'package:crypto_app/presenter/pages/convert_%20currency/widgets/row_picker_cryptos.dart';
import 'package:crypto_app/shared/widgets/default_error_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:network_image_mock/network_image_mock.dart';

import '../../../fake_repository/default_models.dart';
import '../../setup_widget_tester.dart';

void main() {
  group(
    'Testing BodyConvertCurrency',
    () {
      testWidgets(
        'WHEN load BodyConvertCurrencyPage THEN ensure return RowPickerCryptos, ContainerInfoBalanceAmount, PageTitle and ColmunTextFieldQuantity',
        (tester) async {
          await mockNetworkImagesFor(
            () => loadPage(
              tester,
              BodyConvertCurrencyPage(
                walletCryptoEntity: DefaultModels.walletModelBTC,
              ),
            ),
          );

          final containerInfoBalanceAmount =
              find.byType(ContainerInfoBalanceAmount);
          final defaultErrorPage = find.byType(DefaultErrorPage);
          final pageTitle = find.byType(PageTitle);
          final rowPickerCryptos = find.byType(RowPickerCryptos);
          final colmunTextFieldQuantity = find.byType(ColumnTextFieldQuantity);

          expect(containerInfoBalanceAmount, findsOneWidget);
          expect(pageTitle, findsOneWidget);
          expect(rowPickerCryptos, findsOneWidget);
          expect(colmunTextFieldQuantity, findsOneWidget);
          expect(defaultErrorPage, findsNothing);
        },
      );

      testWidgets(
        'WHEN error BodyConvertCurrencyPage THEN ensure return DefaultErrorPage',
        (tester) async {
          await mockNetworkImagesFor(
            () => loadPageError(
              tester,
              BodyConvertCurrencyPage(
                walletCryptoEntity: DefaultModels.walletModelBTC,
              ),
            ),
          );

          final containerInfoBalanceAmount =
              find.byType(ContainerInfoBalanceAmount);
          final defaultErrorPage = find.byType(DefaultErrorPage);
          final pageTitle = find.byType(PageTitle);
          final rowPickerCryptos = find.byType(RowPickerCryptos);
          final colmunTextFieldQuantity = find.byType(ColumnTextFieldQuantity);

          expect(containerInfoBalanceAmount, findsNothing);
          expect(pageTitle, findsNothing);
          expect(rowPickerCryptos, findsNothing);
          expect(colmunTextFieldQuantity, findsNothing);
          expect(defaultErrorPage, findsOneWidget);

          await tester.tap(find.byType(MaterialButton));
          await tester.pumpAndSettle();

          expect(defaultErrorPage, findsOneWidget);
        },
      );
    },
  );
}
