import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';

import '../../../../domain/entities/wallet_crypto_entity.dart';
import '../../../controllers/visibility/visibility_provider.dart';
import 'button_details_crypto.dart';

class MonetaryInfosCryptoInTile extends HookConsumerWidget {
  const MonetaryInfosCryptoInTile({
    Key? key,
    required this.walletCryptoEntity,
  }) : super(key: key);

  final WalletCryptoEntity walletCryptoEntity;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final visibility = ref.watch(visibilityProvider);

    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Visibility(
              visible: visibility,
              replacement: Container(
                width: MediaQuery.of(context).size.width * 0.3,
                height: 20,
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              child: Text(
                NumberFormat.currency(symbol: 'R\$').format(
                  walletCryptoEntity.getValueQuantityCrypto().toDouble(),
                ),
                style: const TextStyle(
                  fontSize: 19,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Visibility(
              visible: visibility,
              replacement: Container(
                width: MediaQuery.of(context).size.width * 0.1,
                height: 20,
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              child: Text(
                '${NumberFormat.decimalPattern().format(
                  walletCryptoEntity.quantity.toDouble(),
                )} ${walletCryptoEntity.crypto.initials}',
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.grey.shade800,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ],
        ),
        ButtonDetailsCrypto(
          walletCryptoEntity: walletCryptoEntity,
        ),
      ],
    );
  }
}
