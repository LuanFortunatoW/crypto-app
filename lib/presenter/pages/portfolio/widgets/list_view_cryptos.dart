import 'package:crypto_app/l10n/app_localizations.dart';

import '../../../../shared/widgets/default_error_page.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../domain/entities/wallet_crypto_entity.dart';
import '../../../controllers/cryptos/cryptos_provider.dart';
import 'list_tile_crypto.dart';
import 'loading_list_view_crypto.dart';

class ListViewCryptos extends HookConsumerWidget {
  const ListViewCryptos({
    Key? key,
  }) : super(key: key); // coverage:ignore-line

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final wallet = ref.watch(
      cryptosProvider(AppLocalizations.of(context)!.monetaryAbbreviation),
    );
    return wallet.when(
      data: ((data) => ListView.separated(
            physics: const ClampingScrollPhysics(),
            shrinkWrap: true,
            padding: const EdgeInsets.only(top: 30),
            itemCount: data.cryptos.length,
            separatorBuilder: (context, index) => const Divider(
              thickness: 1,
              color: Color.fromRGBO(227, 228, 235, 1),
              height: 16,
            ),
            itemBuilder: (context, index) {
              WalletCryptoEntity walletCryptoEntity = data.cryptos[index];
              return ListTileCrypto(walletCryptoEntity: walletCryptoEntity);
            },
          )),
      error: (error, stackTrace) => DefaultErrorPage(
        onPressed: () => ref.refresh(cryptosProvider(
            AppLocalizations.of(context)!.monetaryAbbreviation)),
      ),
      loading: (() => const LoadingListViewCrypto()),
    );
  }
}
