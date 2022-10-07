import 'package:crypto_app/domain/entities/wallet_crypto_entity.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../domain/entities/crypto_entity.dart';
import '../../../../domain/entities/wallet_entity.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../controllers/convertion_validation/convert_validation_provider.dart';
import '../../../controllers/currency_convert/convert_quantity_provider.dart';
import '../../../controllers/currency_convert/converted_currency.dart';
import '../../../controllers/currency_convert/to_convert_currency.dart';

class BottomSheetSelectCrypto extends HookConsumerWidget {
  const BottomSheetSelectCrypto({
    Key? key,
    required this.data,
    required this.provider,
  }) : super(key: key);

  final WalletEntity data;
  final AutoDisposeStateProvider<WalletCryptoEntity> provider;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.4,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 30, left: 16, bottom: 16),
            child: Text(
              AppLocalizations.of(context)!.selectCurrency,
              style: const TextStyle(
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
                    ref.read(provider.notifier).state = data.cryptos[index];
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
  }
}
