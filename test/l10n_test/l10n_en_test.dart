import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';

import '../widget_test/setup_widget_tester.dart';
import 'setup_l10n.dart';

void main() {
  testWidgets(
    'Testing support to pt translations',
    (tester) async {
      const widget = SetupWidgetTester(
        navigatorObservers: [],
        locale: Locale('en'),
        child: Setupl10n(),
      );
      await tester.pumpWidget(widget);
      await tester.pumpAndSettle();

      expect(find.text('en'), findsOneWidget);
      expect(find.text('\$'), findsOneWidget);
      expect(find.text('usd'), findsOneWidget);
      expect(find.text('Portfolio'), findsOneWidget);
      expect(find.text('Transactions'), findsOneWidget);
      expect(find.text('Crypto'), findsOneWidget);
      expect(find.text('Total currency value'), findsOneWidget);
      expect(find.text('Details'), findsOneWidget);
      expect(find.text('Current Price'), findsOneWidget);
      expect(find.text('24h Variation'), findsOneWidget);
      expect(find.text('Quantity'), findsOneWidget);
      expect(find.text('Value'), findsOneWidget);
      expect(find.text('Convert Currency'), findsOneWidget);
      expect(find.text('Available Balance'), findsOneWidget);
      expect(find.text('Estimated total'), findsOneWidget);
      expect(find.text('How much would you like to convert?'), findsOneWidget);
      expect(find.text('Select a currency to convert'), findsOneWidget);
      expect(find.text('Value greater than the available balance'),
          findsOneWidget);
      expect(find.text('Review your conversion data'), findsOneWidget);
      expect(find.text('Convert'), findsOneWidget);
      expect(find.text('Receive'), findsOneWidget);
      expect(find.text('Exchange'), findsOneWidget);
      expect(find.text('Complete Conversion'), findsOneWidget);
      expect(find.text('Conversion performed'), findsOneWidget);
      expect(find.text('Currency conversion performed successfully!'),
          findsOneWidget);
      expect(find.text('Loading Error'), findsOneWidget);
      expect(find.text('Try Again'), findsOneWidget);
    },
  );
}
