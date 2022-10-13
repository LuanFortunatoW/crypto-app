import 'package:crypto_app/presenter/pages/conversion_review/widgets/row_info_conversion.dart';
import 'package:flutter/material.dart';

import '../../crypto_info/widgets/divider_crypto_info.dart';
import '../conversion_review_args.dart';
import 'button_confirm_conversion.dart';

class ConversionReviewBody extends StatelessWidget {
  const ConversionReviewBody({
    Key? key,
    required this.args,
  }) : super(key: key);

  final ConversionReviewArgs args;

  @override
  Widget build(BuildContext context) {
    final converted = args.conversionEntity.convertedCrypto;
    final toConvert = args.conversionEntity.toConvertCrypto;

    final String toReceive = '${(args.conversionEntity.quantity * double.parse(
          converted.currentPrice.toString(),
        ) / double.parse(
          toConvert.currentPrice.toString(),
        )).toStringAsFixed(8).replaceAll('.', ',')} ${toConvert.symbol.toUpperCase()}';

    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.all(16.0),
          child: Text(
            'Revise os dados da sua conversão',
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const Spacer(),
        Column(
          children: [
            const DividerCryptoInfo(),
            RowInfoConversion(
              label: 'Converter',
              text:
                  '${args.conversionEntity.quantity.toStringAsFixed(8).replaceAll('.', ',')} ${converted.symbol.toUpperCase()}',
            ),
            const DividerCryptoInfo(),
            RowInfoConversion(label: 'Receber', text: toReceive),
            const DividerCryptoInfo(),
            RowInfoConversion(
                label: 'Câmbio',
                text:
                    '1 ${args.conversionEntity.convertedCrypto.symbol.toUpperCase()} = ${(args.conversionEntity.convertedCrypto.currentPrice.toDouble() / args.conversionEntity.toConvertCrypto.currentPrice.toDouble()).toStringAsFixed(2).replaceAll('.', ',')} ${args.conversionEntity.toConvertCrypto.symbol.toUpperCase()}'),
            ButtonConfirmConversion(
              conversionEntity: args.conversionEntity,
            ),
          ],
        ),
      ],
    );
  }
}
