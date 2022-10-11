import 'package:crypto_app/presenter/pages/crypto_info/crypto_info_page.dart';
import 'package:crypto_app/presenter/pages/portfolio/widgets/list_tile_crypto.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:network_image_mock/network_image_mock.dart';

import '../../../fake_repository/default_models.dart';
import '../../setup_widget_tester.dart';

void main() {
  setUpAll(
    () {
      registerFallbackValue(FakeRoute());
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
}
