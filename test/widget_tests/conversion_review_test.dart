import 'package:crypto_app/presenter/pages/conversion_review/conversion_review_page.dart';
import 'package:crypto_app/presenter/pages/conversion_review/widgets/button_confirm_conversion.dart';
import 'package:crypto_app/presenter/pages/conversion_review/widgets/conversion_review_body.dart';
import 'package:crypto_app/presenter/pages/conversion_review/widgets/row_info_conversion.dart';
import 'package:crypto_app/shared/widgets/app_bar_app.dart';
import 'package:crypto_app/shared/widgets/divider_crypto_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../default_models.dart';
import '../setup_widget_tester.dart';

void main() {
  group(
    'Testing conversion review page',
    () {
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
      testWidgets(
        'WHEN load ConversionReviewBody THEN ensure return Text, DividerCryptoInfo, RowInfoConversion and ButtonConfirmConversion',
        (tester) async {
          await loadPage(
            tester,
            ConversionReviewBody(
              args: DefaultModels.conversionReviewArgs,
            ),
          );

          final text = find.byType(Text);
          final dividerCryptoInfo = find.byType(DividerCryptoInfo);
          final rowInfoConversion = find.byType(RowInfoConversion);
          final buttonConfirmConversion = find.byType(ButtonConfirmConversion);

          expect(text, findsNWidgets(8));
          expect(dividerCryptoInfo, findsNWidgets(3));
          expect(rowInfoConversion, findsNWidgets(3));
          expect(buttonConfirmConversion, findsOneWidget);
        },
      );
      testWidgets(
        'WHEN load RowInfoConversion THEN ensure return Texts',
        (tester) async {
          const label = 'Moeda: ';
          const text = 'Bitcoin';

          await loadPage(
            tester,
            const RowInfoConversion(
              label: label,
              text: text,
            ),
          );

          final texts = find.byType(Text);
          final textLabel = tester.widget<Text>(texts.first);
          final textText = tester.widget<Text>(texts.last);

          expect(texts, findsNWidgets(2));

          expect(textLabel.data, label);
          expect(textText.data, text);
        },
      );
      testWidgets(
        'WHEN load ButtonConfirmConversion THEN ensure return MaterialButton',
        (tester) async {
          await loadPage(
            tester,
            ButtonConfirmConversion(
              conversionEntity: DefaultModels.conversionEntity,
            ),
          );

          final button = find.byType(MaterialButton);
          final buttonInfo = tester.widget<MaterialButton>(button);

          expect(button, findsOneWidget);
          expect(buttonInfo.elevation, 0);
          expect(buttonInfo.height, 56);
        },
      );
    },
  );
}
