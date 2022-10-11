import 'package:crypto_app/presenter/pages/conversion_confirmation/conversion_confirmation_page.dart';
import 'package:crypto_app/presenter/pages/conversion_confirmation/widgets/conversion_confirmation_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../setup_widget_tester.dart';

void main() {
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
}
