import 'package:flutter/material.dart';

import '../../../../domain/entities/wallet_crypto_entity.dart';

class IconArrowRight extends StatelessWidget {
  const IconArrowRight({
    required this.walletCryptoEntity,
    Key? key,
  }) : super(key: key);

  final WalletCryptoEntity walletCryptoEntity;

  @override
  Widget build(BuildContext context) {
    return Icon(
      Icons.arrow_forward_ios_sharp,
      size: 14,
      color: Colors.grey.shade800,
    );
  }
}
