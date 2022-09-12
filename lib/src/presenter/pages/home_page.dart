import 'package:crypto_app/src/domain/entities/crypto_entity.dart';
import 'package:crypto_app/src/presenter/controllers/cryptos/cryptos_provider.dart';
import 'package:crypto_app/src/presenter/controllers/visibility/visibility_provider.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';

class WalletPage extends StatefulHookConsumerWidget {
  const WalletPage({Key? key}) : super(key: key);

  @override
  ConsumerState<WalletPage> createState() => _WalletPageState();
}

class _WalletPageState extends ConsumerState<WalletPage> {
  @override
  Widget build(BuildContext context) {
    final wallet = ref.watch(cryptoNotifierProvider);
    final visibility = ref.watch(visibilityProvider.notifier).state;

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.only(top: 30),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Cripto',
                            style: TextStyle(
                              color: Color.fromRGBO(224, 43, 87, 1),
                              fontSize: 32,
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              ref.watch(visibilityProvider).changeVisibility();
                              setState(() {});
                            },
                            icon: const Icon(Icons.remove_red_eye),
                          ),
                        ],
                      ),
                    ),
                    Visibility(
                      visible: visibility.state,
                      replacement: Container(
                        width: MediaQuery.of(context).size.width * 0.5,
                        height: 38,
                        decoration: BoxDecoration(
                          color: Colors.grey.shade300,
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      child: Text(
                        NumberFormat.currency(symbol: 'R\$', decimalDigits: 2)
                            .format(
                          wallet.getWalletValue().toDouble(),
                        ),
                        style: const TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ),
                    Text(
                      'Valor total de moedas',
                      style: TextStyle(
                        color: Colors.grey.shade700,
                        fontSize: 17,
                      ),
                    ),
                  ],
                ),
              ),
              Visibility(
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
                    CryptoEntity cryptoEntity = wallet.cryptos[index].crypto;
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              CircleAvatar(
                                radius: 24,
                                backgroundImage:
                                    Image.asset(cryptoEntity.image).image,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 8),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      cryptoEntity.initials,
                                      style: const TextStyle(
                                        fontSize: 19,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    Text(
                                      cryptoEntity.name,
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
                          ),
                          Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Visibility(
                                    visible: visibility.state,
                                    replacement: Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.3,
                                      height: 20,
                                      decoration: BoxDecoration(
                                        color: Colors.grey.shade300,
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                    ),
                                    child: Text(
                                      NumberFormat.currency(symbol: 'R\$')
                                          .format(
                                        wallet.cryptos[index]
                                            .getValueQuatityCrypto()
                                            .toDouble(),
                                      ),
                                      style: const TextStyle(
                                        fontSize: 19,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                  Visibility(
                                    visible: visibility.state,
                                    replacement: Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.1,
                                      height: 20,
                                      decoration: BoxDecoration(
                                        color: Colors.grey.shade300,
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                    ),
                                    child: Text(
                                      '${NumberFormat.decimalPattern().format(
                                        wallet.cryptos[index].quantity
                                            .toDouble(),
                                      )} ${cryptoEntity.initials}',
                                      style: TextStyle(
                                        fontSize: 15,
                                        color: Colors.grey.shade800,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              IconButton(
                                alignment: Alignment.topCenter,
                                onPressed: () {},
                                icon: Icon(
                                  Icons.arrow_forward_ios_sharp,
                                  size: 14,
                                  color: Colors.grey.shade800,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.white,
          selectedItemColor: const Color.fromRGBO(224, 43, 87, 1),
          unselectedItemColor: Colors.grey,
          items: [
            BottomNavigationBarItem(
              icon: ImageIcon(
                Image.asset('assets/images/Subtract.png').image,
              ),
              label: 'Portfólio',
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(
                Image.asset('assets/images/Union.png').image,
              ),
              label: 'Portfólio',
            ),
          ],
        ),
      ),
    );
  }
}
