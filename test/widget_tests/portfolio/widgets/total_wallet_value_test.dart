import 'package:crypto_app/presenter/pages/portfolio/widgets/total_wallet_value.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:network_image_mock/network_image_mock.dart';

import '../../setup_widget_tester.dart';

void main() {
  testWidgets(
    'WHEN error TotalWalletValue THEN ensure return Container',
    (WidgetTester tester) async {
      await mockNetworkImagesFor(
        () => loadPageError(
          tester,
          const TotalWalletValue(),
        ),
      );

      final totalWalletValue = find.byType(Text);
      final container = find.byType(Container);

      expect(totalWalletValue, findsNothing);
      expect(container, findsOneWidget);
    },
  );
}
