import 'package:crypto_app/presenter/pages/conversion_confirmation/conversion_confirmation_page.dart';
import 'package:crypto_app/presenter/pages/conversion_confirmation/widgets/conversion_confirmation_body.dart';
import 'package:crypto_app/presenter/pages/portfolio/portfolio_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../setup_widget_tester.dart';

void main() {
  group(
    'Testing conversion Confirmation page',
    () {
      testWidgets(
        'WHEN load ConversionConfirmationPage THEN ensure return AppBar and ConversionConfirmationBody',
        (tester) async {
          await loadPage(
            tester,
            const ConversionConfirmationPage(),
          );

          final appBar = find.byType(AppBar);
          final conversionConfirmationBody =
              find.byType(ConversionConfirmationBody);

          expect(appBar, findsOneWidget);
          expect(conversionConfirmationBody, findsOneWidget);
        },
      );
      testWidgets(
        'WHEN load ConversionReview AppBar THEN ensure return Leading icon is correct and navigates',
        (tester) async {
          await loadPage(
            tester,
            const ConversionConfirmationPage(),
          );

          await tester.press(find.byIcon(Icons.close));
          await tester.pumpAndSettle();

          final page = find.byType(PortfolioPage);

          expect(page, findsOneWidget);
        },
      );
    },
  );
}
