import 'package:crypto_app/presenter/pages/conversion_confirmation/conversion_confirmation_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../unit_test/shared/mocks.dart';
import '../../setup_widget_tester.dart';

void main() {
  setUpAll(() {
    registerFallbackValue(FakeRoute());
  });
  testWidgets(
    'WHEN click IconButton THEN ensure return PortfolioPage',
    (tester) async {
      final mockNavigatorObserver = MockNavigatorObserver();
      await loadPageObserver(
        tester,
        const ConversionConfirmationPage(),
        [mockNavigatorObserver],
      );

      await tester.tap(find.byIcon(Icons.close));

      verify(() => mockNavigatorObserver.didPop(any(), any()));
    },
  );
}
