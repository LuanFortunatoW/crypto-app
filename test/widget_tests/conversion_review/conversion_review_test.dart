import 'package:crypto_app/presenter/pages/conversion_review/conversion_review_page.dart';
import 'package:crypto_app/presenter/pages/conversion_review/widgets/conversion_review_body.dart';
import 'package:crypto_app/shared/widgets/app_bar_app.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../fake_repository/default_models.dart';
import '../setup_widget_tester.dart';

void main() {
  testWidgets(
    'WHEN load ConversionReviewPage THEN ensure return AppBar and ConversionReviewBody',
    (tester) async {
      await loadPage(
        tester,
        ConversionReviewPage(
          args: DefaultModels.conversionReviewArgs,
        ),
      );

      final appBar = find.byType(AppBarApp);
      final conversionReviewBody = find.byType(ConversionReviewBody);

      expect(appBar, findsOneWidget);
      expect(conversionReviewBody, findsOneWidget);
    },
  );
}
