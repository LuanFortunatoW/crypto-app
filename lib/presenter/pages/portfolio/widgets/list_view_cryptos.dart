import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../domain/entities/wallet_crypto_entity.dart';
import '../../../controllers/cryptos/cryptos_provider.dart';
import 'icon_arrow_right.dart';
import 'list_tile_crypto.dart';

class ListViewCryptos extends HookConsumerWidget {
  const ListViewCryptos({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final wallet = ref.watch(cryptosProvider);

    return wallet.when(
      data: ((data) => Expanded(
            child: ListView.separated(
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
            ),
          )),
      error: (error, stackTrace) => Container(),
      loading: (() => Expanded(
            child: ListView.separated(
              shrinkWrap: true,
              padding: const EdgeInsets.only(top: 30),
              itemCount: 20,
              separatorBuilder: (context, index) => const Divider(
                thickness: 1,
                color: Color.fromRGBO(227, 228, 235, 1),
                height: 16,
              ),
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Shimmer.fromColors(
                            baseColor: Colors.grey.shade300,
                            highlightColor: Colors.grey.shade100,
                            child: const CircleAvatar(
                              radius: 24,
                              backgroundColor: Colors.black,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 8),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Shimmer.fromColors(
                                  baseColor: Colors.grey.shade300,
                                  highlightColor: Colors.grey.shade100,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Colors.black,
                                      borderRadius: BorderRadius.circular(6),
                                    ),
                                    height: 24,
                                    width: MediaQuery.of(context).size.width *
                                        0.25,
                                  ),
                                ),
                                const SizedBox(height: 5),
                                Shimmer.fromColors(
                                  baseColor: Colors.grey.shade300,
                                  highlightColor: Colors.grey.shade100,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Colors.black,
                                      borderRadius: BorderRadius.circular(6),
                                    ),
                                    height: 14,
                                    width:
                                        MediaQuery.of(context).size.width * 0.4,
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
                              Shimmer.fromColors(
                                baseColor: Colors.grey.shade300,
                                highlightColor: Colors.grey.shade100,
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.black,
                                    borderRadius: BorderRadius.circular(6),
                                  ),
                                  height: 24,
                                  width:
                                      MediaQuery.of(context).size.width * 0.3,
                                ),
                              ),
                              const SizedBox(height: 5),
                              Shimmer.fromColors(
                                baseColor: Colors.grey.shade300,
                                highlightColor: Colors.grey.shade100,
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.black,
                                    borderRadius: BorderRadius.circular(6),
                                  ),
                                  height: 14,
                                  width:
                                      MediaQuery.of(context).size.width * 0.2,
                                ),
                              ),
                            ],
                          ),
                          const IconArrowRight(),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
          )),
    );
  }
}
