import 'package:crypto_app/presenter/pages/convert_%20currency/convert_currency_page.dart';
import 'package:crypto_app/presenter/pages/crypto_info/widgets/button_convert_currency.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:network_image_mock/network_image_mock.dart';

import '../../../fake_repository/default_models.dart';
import '../../setup_widget_tester.dart';

void main() {
  setUpAll(() {
    registerFallbackValue(FakeRoute());
  });

  testWidgets(
    'WHEN click ButtonConvertCurrency THEN ensure Navigates to convert_currency',
    (tester) async {
      final mockNavigatorObserver = MockNavigatorObserver();
      await mockNetworkImagesFor(
        () => loadPageObserver(
          tester,
          ButtonConvertCurrency(
            walletCryptoEntity: DefaultModels.walletModelBTC,
          ),
          [mockNavigatorObserver],
        ),
      );

      await tester.tap(find.byType(ButtonConvertCurrency));
      await mockNetworkImagesFor(
        () => tester.pumpAndSettle(),
      );

      verify(() => mockNavigatorObserver.didPush(any(), any()));

      expect(find.byType(ConvertCurrencyPage), findsOneWidget);
    },
  );
}
