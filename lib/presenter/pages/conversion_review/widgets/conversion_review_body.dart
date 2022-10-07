import 'package:crypto_app/l10n/app_localizations.dart';
import 'package:flutter/material.dart';

import '../../../../shared/widgets/divider_crypto_info.dart';
import '../conversion_review_args.dart';
import 'button_confirm_conversion.dart';
import 'row_info_conversion.dart';

class ConversionReviewBody extends StatelessWidget {
  const ConversionReviewBody({
    Key? key,
    required this.args,
  }) : super(key: key);

  final ConversionReviewArgs args;

  @override
  Widget build(BuildContext context) {
    final localization = AppLocalizations.of(context)!;
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
                  '${args.conversionEntity.quantity.toStringAsFixed(8).replaceAll('.', ',')} ${args.conversionEntity.convertedCrypto.symbol.toUpperCase()}',
            ),
            const DividerCryptoInfo(),
            RowInfoConversion(
                label: localization.receive,
                text:
                    '${(args.conversionEntity.quantity * double.parse(args.conversionEntity.convertedCrypto.currentPrice.toString()) / double.parse(args.conversionEntity.toConvertCrypto.currentPrice.toString())).toStringAsFixed(8).replaceAll('.', ',')} ${args.conversionEntity.toConvertCrypto.symbol.toUpperCase()}'),
            const DividerCryptoInfo(),
            RowInfoConversion(
                label: localization.exchange,
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
