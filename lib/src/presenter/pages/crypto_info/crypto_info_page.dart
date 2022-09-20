import 'package:crypto_app/src/presenter/controllers/crypto_in_wallet/crypto_in_wallet_provider.dart';
import 'package:crypto_app/src/presenter/pages/crypto_info/widgets/crypto_info_chart.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CryptoInfoPage extends HookConsumerWidget {
  const CryptoInfoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final walletCryptoEntity = ref.watch(cryptoInWalletProvider.state).state;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  top: 32,
                  right: 18,
                  left: 16,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          walletCryptoEntity.crypto.name,
                          style: const TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          walletCryptoEntity.crypto.initials,
                          style: const TextStyle(
                            fontSize: 17,
                            color: Color.fromRGBO(117, 118, 128, 1),
                          ),
                        ),
                      ],
                    ),
                    CircleAvatar(
                      backgroundImage: Image.asset(
                        walletCryptoEntity.crypto.image,
                      ).image,
                      radius: 24,
                    ),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(
                  top: 16,
                  left: 16,
                  right: 16,
                ),
                child: CryptoInfoChart(),
              ),
              const DividerCryptoInfo(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Preço Atual',
                      style: TextStyle(
                        fontSize: 19,
                        color: Color.fromRGBO(117, 118, 128, 1),
                      ),
                    ),
                    Text(
                      'R\$ ${walletCryptoEntity.crypto.price}',
                      style: const TextStyle(
                        fontSize: 19,
                      ),
                    ),
                  ],
                ),
              ),
              const DividerCryptoInfo(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      'Variação 24H',
                      style: TextStyle(
                        fontSize: 19,
                        color: Color.fromRGBO(117, 118, 128, 1),
                      ),
                    ),
                    Text(
                      '-0,50%',
                      style: TextStyle(
                        fontSize: 19,
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              const DividerCryptoInfo(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Quantidade',
                      style: TextStyle(
                        fontSize: 19,
                        color: Color.fromRGBO(117, 118, 128, 1),
                      ),
                    ),
                    Text(
                      '${walletCryptoEntity.quantity} ${walletCryptoEntity.crypto.initials}',
                      style: const TextStyle(
                        fontSize: 19,
                      ),
                    ),
                  ],
                ),
              ),
              const DividerCryptoInfo(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Valor',
                      style: TextStyle(
                        fontSize: 19,
                        color: Color.fromRGBO(117, 118, 128, 1),
                      ),
                    ),
                    Text(
                      'R\$ ${walletCryptoEntity.getValueQuantityCrypto()}',
                      style: const TextStyle(
                        fontSize: 19,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 45),
                child: MaterialButton(
                  minWidth: double.infinity,
                  onPressed: () {},
                  color: const Color.fromRGBO(224, 43, 87, 1),
                  elevation: 0,
                  height: 56,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                  child: const Text(
                    'Converter Moeda',
                    style: TextStyle(
                      fontSize: 17,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DividerCryptoInfo extends StatelessWidget {
  const DividerCryptoInfo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Divider(
      color: Color.fromRGBO(227, 228, 235, 1),
      indent: 16,
      height: 40,
      thickness: 1,
    );
  }
}
