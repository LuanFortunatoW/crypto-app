import 'package:crypto_app/presenter/pages/convert_%20currency/convert_currency_page.dart';
import 'package:crypto_app/presenter/pages/convert_%20currency/widgets/button_select_currency.dart';
import 'package:crypto_app/presenter/pages/convert_%20currency/widgets/button_swap_cryptos.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:network_image_mock/network_image_mock.dart';

import '../../../fake_repository/default_models.dart';
import '../../setup_widget_tester.dart';

void main() {
  testWidgets(
    'WHEN click ButtonSwapCryptos THEN ensure return change cryptos',
    (tester) async {
      await mockNetworkImagesFor(
        () => loadPage(
          tester,
          ConvertCurrencyPage(args: DefaultModels.convertCurrencyArgs),
        ),
      );

      final textField = find.byType(TextField);
      // final showModalBottomSheetButtonLeft =
      //     find.byType(MaterialButton).first;
      final showModalBottomSheetButtonRight =
          find.byType(ButtonSelectCurrency).last;

      await tester.enterText(textField, '0,05');
      await tester.pumpAndSettle();

      await tester.tap(showModalBottomSheetButtonRight);
      await tester.pumpAndSettle();

      final listTileCrypto = find.byType(ListTile).last;

      await tester.tap(listTileCrypto);
      await tester.pumpAndSettle();

      Text leftButtonCrypto =
          tester.widget<Text>(find.byKey(const Key('CryptoValue')).first);
      Text rightButtonCrypto =
          tester.widget<Text>(find.byKey(const Key('CryptoValue')).last);

      expect(leftButtonCrypto.data, 'BTC');
      expect(rightButtonCrypto.data, 'ETH');

      final buttonSwapCryptos = find.byType(ButtonSwapCryptos);

      await tester.tap(buttonSwapCryptos);
      await tester.pumpAndSettle();

      leftButtonCrypto =
          tester.widget<Text>(find.byKey(const Key('CryptoValue')).first);
      rightButtonCrypto =
          tester.widget<Text>(find.byKey(const Key('CryptoValue')).last);

      expect(leftButtonCrypto.data, 'ETH');
      expect(rightButtonCrypto.data, 'BTC');
    },
  );
}
