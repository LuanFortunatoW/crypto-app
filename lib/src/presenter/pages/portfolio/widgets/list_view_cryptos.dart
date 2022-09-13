import 'package:crypto_app/src/domain/entities/wallet_crypto_entity.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../controllers/cryptos/cryptos_provider.dart';
import 'list_tile_crypto.dart';

class ListViewCryptos extends HookConsumerWidget {
  const ListViewCryptos({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final wallet = ref.watch(cryptoNotifierProvider);

    return Visibility(
      visible: wallet.cryptos.isNotEmpty,
      child: ListView.separated(
        physics: const ClampingScrollPhysics(),
        shrinkWrap: true,
        padding: const EdgeInsets.only(top: 30),
        itemCount: wallet.cryptos.length,
        separatorBuilder: (context, index) => const Divider(
          thickness: 1,
          color: Color.fromRGBO(227, 228, 235, 1),
          height: 16,
        ),
        itemBuilder: (context, index) {
          WalletCryptoEntity walletCryptoEntity = wallet.cryptos[index];
          return ListTileCrypto(walletCryptoEntity: walletCryptoEntity);
        },
      ),
    );
  }
}
