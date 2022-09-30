import '../../../../domain/entities/wallet_entity.dart';
import '../../../controllers/currency_convert/convert_quantity_provider.dart';
import '../../../controllers/currency_convert/to_convert_currency.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../domain/entities/crypto_entity.dart';
import '../../../../domain/entities/wallet_crypto_entity.dart';
import '../../../controllers/convertion_validation/convert_validation_provider.dart';
import '../../../controllers/currency_convert/converted_currency.dart';

class ButtonSelectCurrency extends HookConsumerWidget {
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
  Widget build(BuildContext context, WidgetRef ref) {
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
            return SizedBox(
              height: MediaQuery.of(context).size.height * 0.4,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(top: 30, left: 16, bottom: 16),
                    child: Text(
                      'Escolha uma moeda para converter',
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const Divider(
                    color: Color.fromRGBO(227, 228, 235, 1),
                    thickness: 1,
                  ),
                  Expanded(
                    child: ListView.separated(
                      itemCount: data.cryptos.length,
                      separatorBuilder: (context, index) {
                        return const Divider(
                          color: Color.fromRGBO(227, 228, 235, 1),
                          thickness: 1,
                        );
                      },
                      itemBuilder: (context, index) {
                        CryptoEntity crypto = data.cryptos[index].crypto;
                        return ListTile(
                          title: Text(
                            crypto.symbol.toUpperCase(),
                          ),
                          subtitle: Text(
                            crypto.name,
                          ),
                          trailing: const Icon(
                            Icons.keyboard_arrow_right_outlined,
                          ),
                          onTap: () {
                            ref.read(provider.notifier).state =
                                data.cryptos[index];
                            ref
                                .read(convertValidationProvider.notifier)
                                .validateconversion(
                                  ref.read(convertQuantityProvider),
                                  ref.read(convertedCurrencyProvider),
                                  ref.read(toConvertCurrencyProvider),
                                );
                            Navigator.pop(context);
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
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
