import '../../../controllers/currency_convert/to_convert_currency.dart';
import 'package:decimal/decimal.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';

import '../../../controllers/convertion_validation/convert_validation_provider.dart';
import '../../../controllers/currency_convert/convert_quantity_provider.dart';
import '../../../controllers/currency_convert/converted_currency.dart';

class ColmunTextFieldQuantity extends HookConsumerWidget {
  ColmunTextFieldQuantity({
    Key? key,
  }) : super(key: key);

  String getValueHelper(Decimal value, double quantity) {
    return NumberFormat.currency(symbol: 'R\$')
        .format(
          double.parse(value.toString()) * quantity,
        )
        .replaceAll('.', ',');
  }

  final TextEditingController quantityController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final convertedCurrency = ref.watch(convertedCurrencyProvider);
    final convertQuantity = ref.watch(convertQuantityProvider.state);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextField(
          keyboardType: const TextInputType.numberWithOptions(
            decimal: true,
          ),
          controller: quantityController,
          inputFormatters: [
            FilteringTextInputFormatter.allow(
              RegExp(r'^(\d+)?.?,?\d{0,10}'),
            ),
          ],
          decoration: InputDecoration(
            prefixText: '${convertedCurrency.crypto.symbol.toUpperCase()} ',
            prefixStyle: const TextStyle(
              fontSize: 31,
              color: Colors.black,
            ),
            helperText: getValueHelper(
              convertedCurrency.crypto.currentPrice,
              convertQuantity.state,
            ),
            helperStyle: const TextStyle(
              color: Color.fromRGBO(117, 118, 128, 1),
              fontSize: 15,
            ),
            hintText: '0,00',
            hintStyle: const TextStyle(
              fontSize: 31,
              color: Color.fromRGBO(149, 153, 166, 1),
            ),
            focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(
                color: Colors.black,
                width: 2,
              ),
            ),
          ),
          style: const TextStyle(
            fontSize: 31,
            color: Colors.black,
          ),
          onChanged: (value) {
            if (quantityController.text != '') {
              convertQuantity.state = double.parse(
                quantityController.text.replaceAll(',', '.'),
              );
              ref.read(convertValidationProvider.notifier).validateconversion(
                    ref.read(convertQuantityProvider),
                    ref.read(convertedCurrencyProvider),
                    ref.read(toConvertCurrencyProvider),
                  );
            } else {
              ref.read(convertValidationProvider.notifier).setFalse();
              convertQuantity.state = 0;
            }
          },
        ),
        Visibility(
          visible: quantityController.text != '' &&
              convertQuantity.state > convertedCurrency.quantity,
          child: const Padding(
            padding: EdgeInsets.only(top: 8),
            child: Text(
              'Valor maior que o saldo disponível',
              style: TextStyle(
                color: Color.fromRGBO(224, 43, 87, 1),
                fontSize: 15,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
