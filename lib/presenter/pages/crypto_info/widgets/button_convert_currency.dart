import 'package:crypto_app/domain/entities/wallet_crypto_entity.dart';
import 'package:crypto_app/presenter/pages/convert_%20currency/convert_currency_args.dart';
import 'package:flutter/material.dart';

class ButtonConvertCurrency extends StatelessWidget {
  const ButtonConvertCurrency({
    Key? key,
    required this.walletCryptoEntity,
  }) : super(key: key);

  final WalletCryptoEntity walletCryptoEntity;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 45),
      child: MaterialButton(
        minWidth: double.infinity,
        onPressed: () {
          Navigator.pushNamed(
            context,
            '/convert_currency',
            arguments: ConvertCurrencyArgs(
              walletCryptoEntity: walletCryptoEntity,
            ),
          );
        },
        color: const Color.fromRGBO(224, 43, 87, 1),
        elevation: 0,
        height: 56,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        child: const Text(
          'Converter Moeda',
          style: TextStyle(
            fontSize: 17,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
