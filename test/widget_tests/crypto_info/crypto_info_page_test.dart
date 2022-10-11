import 'package:crypto_app/presenter/pages/crypto_info/crypto_info_page.dart';
import 'package:crypto_app/presenter/pages/crypto_info/widgets/body_info_page.dart';
import 'package:crypto_app/shared/widgets/app_bar_app.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:network_image_mock/network_image_mock.dart';

import '../../fake_repository/default_models.dart';
import '../setup_widget_tester.dart';

void main() {
  testWidgets(
    'WHEN load PortfolioPage THEN ensure return AppBar and BodyInfoPage',
    (tester) async {
      await mockNetworkImagesFor(
        () => loadPage(
          tester,
          CryptoInfoPage(args: DefaultModels.cryptoInfoArgs),
        ),
      );

      final appBar = find.byType(AppBarApp);
      final bodyInfoPage = find.byType(BodyInfoPage);

      expect(appBar, findsOneWidget);
      expect(bodyInfoPage, findsOneWidget);
    },
  );
}
