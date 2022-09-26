import 'package:crypto_app/domain/entities/crypto_entity.dart';
import 'package:crypto_app/domain/entities/wallet_crypto_entity.dart';
import 'package:crypto_app/presenter/controllers/cryptos/cryptos_provider.dart';
import 'package:crypto_app/shared/widgets/default_error_page.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class BodyConverCurrencyPage extends HookConsumerWidget {
  const BodyConverCurrencyPage({
    Key? key,
    required this.walletCryptoEntity,
  }) : super(key: key);

  final WalletCryptoEntity walletCryptoEntity;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    CryptoEntity tradedCrypto = walletCryptoEntity.crypto;
    final allCryptos = ref.watch(cryptosProvider);
    return allCryptos.when(
      data: (data) {
        final toTradeCrypto = data.getFirstDiferentCrypto(tradedCrypto);
        return Center(
          child: Column(
            children: [
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                color: const Color.fromRGBO(245, 246, 250, 1),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Saldo Disponível',
                      style: TextStyle(
                        color: Color.fromRGBO(117, 118, 128, 1),
                        fontSize: 14,
                      ),
                    ),
                    Text(
                      '${walletCryptoEntity.quantity} ${walletCryptoEntity.crypto.symbol.toUpperCase()}',
                      style: const TextStyle(
                        color: Color.fromRGBO(47, 47, 51, 1),
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.9,
                      child: const Text(
                        softWrap: true,
                        'Quanto você gostaria de converter?',
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          color: Color.fromRGBO(47, 47, 51, 1),
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16, right: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    MaterialButton(
                      padding: const EdgeInsets.all(0),
                      shape: RoundedRectangleBorder(
                        side: const BorderSide(
                          color: Colors.grey,
                        ),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      onPressed: () {},
                      child: Row(
                        children: [
                          CircleAvatar(
                            radius: 10,
                            backgroundImage: Image.network(
                              tradedCrypto.image,
                            ).image,
                          ),
                          const SizedBox(width: 5),
                          Text(
                            tradedCrypto.symbol.toUpperCase(),
                            style: const TextStyle(
                              fontSize: 14,
                            ),
                          ),
                          const Icon(
                            Icons.arrow_drop_down_sharp,
                          ),
                        ],
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: ImageIcon(
                        Image.asset('assets/icons/swap.png').image,
                      ),
                    ),
                    MaterialButton(
                      padding: const EdgeInsets.all(0),
                      shape: RoundedRectangleBorder(
                        side: const BorderSide(
                          color: Colors.grey,
                        ),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      onPressed: () {},
                      child: Row(
                        children: [
                          CircleAvatar(
                            radius: 10,
                            backgroundImage: Image.network(
                              toTradeCrypto.image,
                            ).image,
                          ),
                          const SizedBox(width: 5),
                          Text(
                            toTradeCrypto.symbol.toUpperCase(),
                            style: const TextStyle(
                              fontSize: 14,
                            ),
                          ),
                          const Icon(
                            Icons.arrow_drop_down_sharp,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(23.5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextField(
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        hintText: '${tradedCrypto.symbol.toUpperCase()} 0,00',
                        hintStyle: const TextStyle(
                          fontSize: 31,
                          color: Color.fromRGBO(149, 153, 166, 1),
                        ),
                      ),
                      style: const TextStyle(
                        fontSize: 31,
                        color: Color.fromRGBO(149, 153, 166, 1),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 8),
                      child: Text(
                        'R\$ 0,00',
                        style: TextStyle(
                          color: Color.fromRGBO(117, 118, 128, 1),
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
      error: (error, stackTrace) => DefaultErrorPage(
        onPressed: () => ref.refresh(cryptosProvider),
      ),
      loading: () => Container(),
    );
  }
}
