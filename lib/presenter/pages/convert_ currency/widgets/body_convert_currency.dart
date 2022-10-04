import 'package:crypto_app/l10n/app_localizations.dart';

import '../../../../domain/entities/wallet_crypto_entity.dart';
import '../../../controllers/cryptos/cryptos_provider.dart';
import '../../../controllers/currency_convert/converted_currency.dart';
import '../../../../shared/widgets/default_error_page.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'column_text_field_quantity.dart';
import 'container_info_balance_amount.dart';
import 'page_title.dart';
import 'row_picker_cryptos.dart';

class BodyConvertCurrencyPage extends StatefulHookConsumerWidget {
  const BodyConvertCurrencyPage({
    Key? key,
    required this.walletCryptoEntity,
  }) : super(key: key);

  final WalletCryptoEntity walletCryptoEntity;

  @override
  ConsumerState<BodyConvertCurrencyPage> createState() =>
      _BodyConvertCurrencyPageState();
}

class _BodyConvertCurrencyPageState
    extends ConsumerState<BodyConvertCurrencyPage> {
  @override
  void initState() {
    ref.read(convertedCurrencyProvider.notifier).state =
        widget.walletCryptoEntity;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final allCryptos = ref.watch(
        cryptosProvider(AppLocalizations.of(context)!.monetaryAbbreviation));

    return allCryptos.when(
      data: (data) {
        return Center(
          child: Column(
            children: [
              const ContainerInfoBalanceAmount(),
              const PageTitle(),
              RowPickerCryptos(data: data),
              Padding(
                padding: const EdgeInsets.all(23.5),
                child: ColmunTextFieldQuantity(),
              ),
            ],
          ),
        );
      },
      error: (error, stackTrace) => DefaultErrorPage(
        onPressed: () => ref.refresh(cryptosProvider(
            AppLocalizations.of(context)!.monetaryAbbreviation)),
      ),
      loading: () => Container(),
    );
  }
}
