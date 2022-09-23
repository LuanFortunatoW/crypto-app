import 'package:flutter/material.dart';

import '../../../../domain/entities/wallet_crypto_entity.dart';

class CryptoInfosInTile extends StatelessWidget {
  const CryptoInfosInTile({
    Key? key,
    required this.walletCryptoEntity,
  }) : super(key: key);

  final WalletCryptoEntity walletCryptoEntity;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: 24,
          backgroundImage: Image.network(walletCryptoEntity.crypto.image).image,
          backgroundColor: Colors.transparent,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                walletCryptoEntity.crypto.symbol.toUpperCase(),
                style: const TextStyle(
                  fontSize: 19,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                walletCryptoEntity.crypto.name,
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.grey.shade800,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
