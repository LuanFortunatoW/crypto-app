import 'package:crypto_app/domain/entities/wallet_entity.dart';
import 'package:crypto_app/presenter/controllers/currency_convert/converted_currency.dart';
import 'package:crypto_app/presenter/pages/convert_%20currency/widgets/bottom_sheet_select_crypto.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:network_image_mock/network_image_mock.dart';

import '../../../fake_repository/default_models.dart';
import '../../setup_widget_tester.dart';

void main() {
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
}
