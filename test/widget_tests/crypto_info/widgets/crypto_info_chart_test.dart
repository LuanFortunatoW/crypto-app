import 'package:crypto_app/presenter/pages/crypto_info/widgets/buttons_change_days_chart.dart';
import 'package:crypto_app/presenter/pages/crypto_info/widgets/crypto_info_chart.dart';
import 'package:crypto_app/presenter/pages/crypto_info/widgets/title_crypto_price.dart';
import 'package:crypto_app/shared/widgets/default_error_page.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../fake_repository/default_models.dart';
import '../../setup_widget_tester.dart';

void main() {
  group(
    'Testing CryptoInfoChart Widget',
    () {
      testWidgets(
        'WHEN load CryptoInfoChart THEN ensure return LineChart, TitleCryptoPrice, and ButtonsChangeDaysChart ',
        (tester) async {
          await loadPage(
            tester,
            CryptoInfoChart(args: DefaultModels.cryptoInfoArgs),
          );

          final lineChart = find.byType(LineChart);
          final titleCryptoPrice = find.byType(TitleCryptoPrice);
          final buttonsChangeDaysChart = find.byType(ButtonsChangeDaysChart);
          final defaultErrorPage = find.byType(DefaultErrorPage);

          expect(lineChart, findsOneWidget);
          expect(buttonsChangeDaysChart, findsOneWidget);
          expect(titleCryptoPrice, findsOneWidget);
          expect(defaultErrorPage, findsNothing);
        },
      );

      testWidgets(
        'WHEN error CryptoInfoChart THEN ensure return DefaultErrorPage',
        (tester) async {
          await loadPageError(
            tester,
            CryptoInfoChart(args: DefaultModels.cryptoInfoArgs),
          );

          final lineChart = find.byType(LineChart);
          final titleCryptoPrice = find.byType(TitleCryptoPrice);
          final buttonsChangeDaysChart = find.byType(ButtonsChangeDaysChart);
          final defaultErrorPage = find.byType(DefaultErrorPage);

          expect(lineChart, findsNothing);
          expect(buttonsChangeDaysChart, findsNothing);
          expect(titleCryptoPrice, findsNothing);
          expect(defaultErrorPage, findsOneWidget);
        },
      );
    },
  );
}
