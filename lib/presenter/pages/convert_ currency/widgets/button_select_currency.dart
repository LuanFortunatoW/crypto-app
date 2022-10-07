import '../../../../domain/entities/wallet_entity.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../domain/entities/crypto_entity.dart';
import '../../../../domain/entities/wallet_crypto_entity.dart';
import 'bottom_sheet_select_crypto.dart';

class ButtonSelectCurrency extends StatelessWidget {
  const ButtonSelectCurrency({
    Key? key,
    required this.provider,
    required this.cryptoEntity,
    required this.data,
  }) : super(key: key);

  final WalletEntity data;
  final CryptoEntity cryptoEntity;
  final AutoDisposeStateProvider<WalletCryptoEntity> provider;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      padding: const EdgeInsets.all(5),
      shape: RoundedRectangleBorder(
        side: const BorderSide(
          color: Colors.grey,
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      onPressed: () {
        showModalBottomSheet(
          backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
          context: context,
          builder: (context) {
            return BottomSheetSelectCrypto(
              data: data,
              provider: provider,
            );
          },
        );
      },
      child: Row(
        children: [
          CircleAvatar(
            radius: 10,
            backgroundColor: Colors.transparent,
            backgroundImage: Image.network(
              cryptoEntity.image,
            ).image,
          ),
          const SizedBox(width: 5),
          Text(
            cryptoEntity.symbol.toUpperCase(),
            style: const TextStyle(
              fontSize: 14,
            ),
          ),
          const Icon(
            Icons.arrow_drop_down_sharp,
          ),
        ],
      ),
    );
  }
}
