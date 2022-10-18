import 'package:crypto_app/presenter/pages/portfolio/portfolio_page.dart';
import 'package:crypto_app/presenter/pages/portfolio/widgets/body_portifolio_page.dart';
import 'package:crypto_app/shared/widgets/bottom_navigation_bar_app.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:network_image_mock/network_image_mock.dart';

import '../setup_widget_tester.dart';

void main() {
  testWidgets(
    'WHEN load PortfolioPage THEN ensure return BodyPortfolioPage and BottomNavigationBarApp',
    (WidgetTester tester) async {
      await mockNetworkImagesFor(
        () => loadPage(
          tester,
          const PortfolioPage(),
        ),
      );
      final bodyPortifolioPage = find.byType(BodyPortifolioPage);
      final bottomNavigationBarApp = find.byType(BottomNavigationBarApp);
      expect(bodyPortifolioPage, findsOneWidget);
      expect(bottomNavigationBarApp, findsOneWidget);
    },
  );
}
