import 'package:crypto_app/domain/entities/wallet_entity.dart';
import 'package:crypto_app/presenter/controllers/currency_convert/converted_currency.dart';
import 'package:crypto_app/presenter/pages/convert_%20currency/convert_currency_page.dart';
import 'package:crypto_app/presenter/pages/convert_%20currency/widgets/body_convert_currency.dart';
import 'package:crypto_app/presenter/pages/convert_%20currency/widgets/bottom_sheet_amout_to_convert.dart';
import 'package:crypto_app/presenter/pages/convert_%20currency/widgets/bottom_sheet_select_crypto.dart';
import 'package:crypto_app/presenter/pages/convert_%20currency/widgets/button_select_currency.dart';
import 'package:crypto_app/presenter/pages/convert_%20currency/widgets/button_swap_cryptos.dart';
import 'package:crypto_app/presenter/pages/convert_%20currency/widgets/column_text_field_quantity.dart';
import 'package:crypto_app/presenter/pages/convert_%20currency/widgets/container_info_balance_amount.dart';
import 'package:crypto_app/presenter/pages/convert_%20currency/widgets/page_title.dart';
import 'package:crypto_app/presenter/pages/convert_%20currency/widgets/row_picker_cryptos.dart';
import 'package:crypto_app/shared/widgets/app_bar_app.dart';
import 'package:crypto_app/shared/widgets/default_error_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:network_image_mock/network_image_mock.dart';

import '../default_models.dart';
import '../setup_widget_tester.dart';

void main() {
  group(
    'Testing Convert currency page',
    () {
      testWidgets(
        'WHEN load ConvertCurrencyPage THEN ensure return AppBar, BodyConvertCurrencyPage and BottomSheetAmountToConvert',
        (tester) async {
          await loadPage(
            tester,
            ConvertCurrencyPage(args: DefaultModels.convertCurrencyArgs),
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
        'WHEN load BodyConvertCurrencyPage THEN ensure return RowPickerCryptos, ContainerInfoBalanceAmount, PageTitle and ColmunTextFieldQuantity or DefaultErrorPage',
        (tester) async {
          await loadPage(
            tester,
            BodyConvertCurrencyPage(
              walletCryptoEntity: DefaultModels.walletModelBTC,
            ),
          );

          final containerInfoBalanceAmount =
              find.byType(ContainerInfoBalanceAmount);
          final defaultErrorPage = find.byType(DefaultErrorPage);
          final pageTitle = find.byType(PageTitle);
          final rowPickerCryptos = find.byType(RowPickerCryptos);
          final colmunTextFieldQuantity = find.byType(ColumnTextFieldQuantity);

          if (!containerInfoBalanceAmount.precache()) {
            expect(containerInfoBalanceAmount, findsNothing);
            expect(pageTitle, findsNothing);
            expect(rowPickerCryptos, findsNothing);
            expect(colmunTextFieldQuantity, findsNothing);
            expect(defaultErrorPage, findsOneWidget);
          } else {
            expect(containerInfoBalanceAmount, findsOneWidget);
            expect(pageTitle, findsOneWidget);
            expect(rowPickerCryptos, findsOneWidget);
            expect(findsNothing, findsOneWidget);
            expect(defaultErrorPage, findsNothing);
          }
        },
      );
      testWidgets(
        'WHEN load ContainerInfoBalanceAmount THEN ensure return Texts',
        (tester) async {
          await loadPage(
            tester,
            const ContainerInfoBalanceAmount(),
          );

          final texts = find.byType(Text);

          expect(texts, findsNWidgets(2));
        },
      );
      testWidgets(
        'WHEN load PageTitle THEN ensure return Text',
        (tester) async {
          await loadPage(
            tester,
            const PageTitle(),
          );

          final texts = find.byType(Text);

          expect(texts, findsOneWidget);
        },
      );
      testWidgets(
        'WHEN load RowPickerCryptos THEN ensure return ButtonSelectCurrency and ButtonSelectCurrency',
        (tester) async {
          await mockNetworkImagesFor(
            () async {
              await loadPage(
                tester,
                RowPickerCryptos(
                  data: WalletEntity(
                    cryptos: [DefaultModels.walletModelBTC],
                  ),
                ),
              );
            },
          );

          final buttonSelectCurrency = find.byType(ButtonSelectCurrency);
          final buttonSwapCryptos = find.byType(ButtonSwapCryptos);

          expect(buttonSelectCurrency, findsAtLeastNWidgets(2));
          expect(buttonSwapCryptos, findsOneWidget);
        },
      );
      testWidgets(
        'WHEN load ButtonSelectCurrency THEN ensure return CircleAvatar and Text',
        (tester) async {
          await mockNetworkImagesFor(
            () async {
              await loadPage(
                tester,
                ButtonSelectCurrency(
                  data: WalletEntity(
                    cryptos: [DefaultModels.walletModelBTC],
                  ),
                  cryptoEntity: DefaultModels.cryptoModelBTC,
                  provider: convertedCurrencyProvider,
                ),
              );
            },
          );

          final circleAvatar = find.byType(CircleAvatar);
          final text = tester.widget<Text>(find.byType(Text));

          expect(circleAvatar, findsOneWidget);
          expect(text.data, DefaultModels.cryptoModelBTC.symbol.toUpperCase());
        },
      );
      testWidgets(
        'WHEN click ButtonSelectCurrency THEN ensure return BottomSheetSelectCrypto',
        (tester) async {
          await mockNetworkImagesFor(
            () async {
              await loadPage(
                tester,
                RowPickerCryptos(
                  data: WalletEntity(
                    cryptos: [DefaultModels.walletModelBTC],
                  ),
                ),
              );
            },
          );

          await tester.tap(
            find.byType(ButtonSelectCurrency).first,
          );
          await tester.pumpAndSettle();

          final bottomSheet = find.byType(BottomSheetSelectCrypto);

          expect(bottomSheet, findsOneWidget);
        },
      );
      testWidgets(
        'WHEN load BottomSheetSelectCrypto THEN ensure return Text, Divider and ListView',
        (tester) async {
          await mockNetworkImagesFor(
            () async {
              await loadPage(
                tester,
                BottomSheetSelectCrypto(
                  data: WalletEntity(
                    cryptos: [
                      DefaultModels.walletModelBTC,
                    ],
                  ),
                  provider: convertedCurrencyProvider,
                ),
              );
            },
          );

          final text = find.byType(Text);
          final icon = find.byType(Icon);
          final divider = find.byType(Divider);
          final listView = find.byType(ListView);
          final listViewTester = tester.widget<ListView>(find.byType(ListView));

          expect(text, findsNWidgets(3));
          expect(icon, findsOneWidget);
          expect(divider, findsOneWidget);
          expect(listView, findsOneWidget);
          expect(listViewTester.semanticChildCount, 1);
        },
      );
      testWidgets(
        'WHEN click ListTile THEN ensure removes BottomSheetSelectCrypto',
        (tester) async {
          await mockNetworkImagesFor(
            () async {
              await loadPage(
                tester,
                BottomSheetSelectCrypto(
                  data: WalletEntity(
                    cryptos: [
                      DefaultModels.walletModelBTC,
                    ],
                  ),
                  provider: convertedCurrencyProvider,
                ),
              );
            },
          );

          await tester.tap(find.byType(ListTile));
          await tester.pumpAndSettle();

          final bottomSheetSelectCrypto = find.byType(BottomSheetSelectCrypto);

          expect(bottomSheetSelectCrypto, findsNothing);
        },
      );
      testWidgets(
        'WHEN load ButtonSwapCryptos THEN ensure return IconButton',
        (tester) async {
          await loadPage(
            tester,
            ButtonSwapCryptos(
              data: WalletEntity(
                cryptos: [DefaultModels.walletModelBTC],
              ),
            ),
          );

          final iconButton = find.byType(IconButton);
          final imageIcon = find.byType(ImageIcon);

          await tester.tap(iconButton);
          await tester.pumpAndSettle();

          expect(iconButton, findsOneWidget);
          expect(imageIcon, findsOneWidget);
        },
      );
      testWidgets(
        'WHEN load ColumnTextFieldQuantity THEN ensure return TextField, and Texts',
        (tester) async {
          await loadPage(
            tester,
            ColumnTextFieldQuantity(),
          );

          final text = find.byType(Text);
          final textField = find.byType(TextField);

          expect(text, findsNWidgets(3));
          expect(textField, findsOneWidget);
        },
      );
      testWidgets(
        'WHEN load ColumnTextFieldQuantity THEN ensure Textfield Controller is empty',
        (tester) async {
          await loadPage(
            tester,
            ColumnTextFieldQuantity(),
          );

          final textField = tester.widget<TextField>(find.byType(TextField));

          expect(textField.controller!.text, '');
        },
      );
      testWidgets(
        'WHEN load ColumnTextFieldQuantity THEN ensure Textfield Controller changes',
        (tester) async {
          await loadPage(
            tester,
            ColumnTextFieldQuantity(),
          );

          final textField = find.byType(TextField);
          
          await tester.enterText(textField, '0,05');
          await tester.pumpAndSettle();

          final textFieldDetails = tester.widget<TextField>(textField);

          expect(textFieldDetails.controller!.text, '0,05');
        },
      );
    },
  );
}
