import 'package:crypto_app/presenter/pages/conversion_review/conversion_review_args.dart';
import 'package:crypto_app/presenter/pages/crypto_info/widgets/divider_crypto_info.dart';
import 'package:flutter/material.dart';

class ConversionReviewPage extends StatelessWidget {
  const ConversionReviewPage({
    Key? key,
    required this.args,
  }) : super(key: key);

  final ConversionReviewArgs args;

  @override
  Widget build(BuildContext context) {
    final convertedCrypto = args.conversionEntity.convertedCrypto;
    final toConvertCrypto = args.conversionEntity.toConvertCrypto;
    final quantity = args.conversionEntity.quantity;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 1,
      ),
      body: Column(
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
                    '${quantity.toStringAsFixed(8).replaceAll('.', ',')} ${convertedCrypto.symbol.toUpperCase()}',
              ),
              const DividerCryptoInfo(),
              RowInfoConversion(
                  label: 'Receber',
                  text:
                      '${(quantity * double.parse(convertedCrypto.currentPrice.toString()) / double.parse(toConvertCrypto.currentPrice.toString())).toStringAsFixed(8).replaceAll('.', ',')} ${toConvertCrypto.symbol.toUpperCase()}'),
              const DividerCryptoInfo(),
              RowInfoConversion(
                  label: 'Câmbio',
                  text:
                      '1 ${convertedCrypto.symbol.toUpperCase()} = ${(convertedCrypto.currentPrice.toDouble() / toConvertCrypto.currentPrice.toDouble()).toStringAsFixed(2).replaceAll('.', ',')} ${toConvertCrypto.symbol.toUpperCase()}'),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 45),
                child: MaterialButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/conversion_confirmation');
                  },
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                      10,
                    ),
                  ),
                  color: const Color.fromRGBO(224, 43, 87, 1),
                  minWidth: double.maxFinite,
                  height: 56,
                  child: const Text(
                    'Concluir conversão',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class RowInfoConversion extends StatelessWidget {
  const RowInfoConversion({
    Key? key,
    required this.label,
    required this.text,
  }) : super(key: key);

  final String label;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: const TextStyle(
              color: Color.fromRGBO(117, 118, 128, 1),
              fontSize: 19,
            ),
          ),
          Text(
            text,
            style: const TextStyle(
              color: Color.fromRGBO(47, 47, 51, 1),
              fontSize: 19,
            ),
          ),
        ],
      ),
    );
  }
}
