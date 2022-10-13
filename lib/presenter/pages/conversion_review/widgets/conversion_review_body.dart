import 'row_info_conversion.dart';
import 'package:flutter/material.dart';

import '../../../../l10n/app_localizations.dart';
import '../../../../shared/widgets/divider_crypto_info.dart';
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
    final localization = AppLocalizations.of(context)!;
    final converted = args.conversionEntity.convertedCrypto;
    final toConvert = args.conversionEntity.toConvertCrypto;
    final String exchValue =
        (converted.currentPrice.toDouble() / toConvert.currentPrice.toDouble())
            .toStringAsFixed(2)
            .replaceAll('.', ',');
    final String toReceive = '${(args.conversionEntity.quantity * double.parse(
          converted.currentPrice.toString(),
        ) / double.parse(
          toConvert.currentPrice.toString(),
        )).toStringAsFixed(8).replaceAll('.', ',')} ${toConvert.symbol.toUpperCase()}';

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            localization.reviewConversionData,
            style: const TextStyle(
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
              label: localization.convert,
              text:
                  '${args.conversionEntity.quantity.toStringAsFixed(8).replaceAll('.', ',')} ${converted.symbol.toUpperCase()}',
            ),
            const DividerCryptoInfo(),
            RowInfoConversion(label: 'Receber', text: toReceive),
            const DividerCryptoInfo(),
            RowInfoConversion(
              label: 'Câmbio',
              text:
                  '1 $exchValue ${converted.symbol.toUpperCase()} = ${toConvert.symbol}',
            ),
            ButtonConfirmConversion(conversionEntity: args.conversionEntity),
          ],
        ),
      ],
    );
  }
}
