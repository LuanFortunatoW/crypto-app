import 'package:crypto_app/presenter/pages/conversion_confirmation/conversion_confirmation_page.dart';
import 'package:crypto_app/presenter/pages/conversion_review/conversion_review_page.dart';
import 'package:crypto_app/presenter/pages/conversion_review/widgets/button_confirm_conversion.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:network_image_mock/network_image_mock.dart';

import '../../../fake_repository/default_models.dart';
import '../../../unit_test/shared/mocks.dart';
import '../../setup_widget_tester.dart';

void main() {
  setUpAll(() {
    registerFallbackValue(FakeRoute());
  });
  testWidgets(
    'WHEN click ButtonConfirmConversion THEN ensure Navigates',
    (tester) async {
      final mockNavigationObserver = MockNavigatorObserver();
      await mockNetworkImagesFor(
        () => loadPageObserver(
          tester,
          ConversionReviewPage(args: DefaultModels.conversionReviewArgs),
          [mockNavigationObserver],
        ),
      );

      final buttonConfirmConversion = find.byType(ButtonConfirmConversion);
      await tester.tap(buttonConfirmConversion);
      await tester.pumpAndSettle();

      verify(() => mockNavigationObserver.didPush(any(), any()));

      expect(find.byType(ConversionConfirmationPage), findsOneWidget);
    },
  );
}
