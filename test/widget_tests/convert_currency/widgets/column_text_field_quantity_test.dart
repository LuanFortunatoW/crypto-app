import 'package:crypto_app/presenter/pages/convert_%20currency/widgets/column_text_field_quantity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../setup_widget_tester.dart';

void main() {
  group(
    'Testing ColumnTextFieldQuantity',
    () {
      testWidgets(
        'WHEN load ColumnTextFieldQuantity THEN ensure Textfield Controller is empty',
        (tester) async {
          await loadPage(
            tester,
            ColumnTextFieldQuantity(),
          );

          final textField = tester.widget<TextField>(find.byType(TextField));

          expect(textField.controller!.text, '');
        },
      );
      testWidgets(
        "WHEN typing in ColumnTextFieldQuantity's TextField THEN ensure Textfield Controller changes",
        (tester) async {
          await loadPage(
            tester,
            ColumnTextFieldQuantity(),
          );

          final textField = find.byType(TextField);

          await tester.enterText(textField, '5,05');
          await tester.pumpAndSettle();

          TextField textFieldDetails = tester.widget<TextField>(textField);

          expect(textFieldDetails.controller!.text, '5,05');

          await tester.enterText(textField, '');
          await tester.pumpAndSettle();

          textFieldDetails = tester.widget<TextField>(textField);

          expect(textFieldDetails.controller!.text, '');
        },
      );
    },
  );
}
