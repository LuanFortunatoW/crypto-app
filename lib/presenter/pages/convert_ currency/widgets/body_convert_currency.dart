import 'package:crypto_app/domain/entities/wallet_crypto_entity.dart';
import 'package:crypto_app/presenter/controllers/cryptos/cryptos_provider.dart';
import 'package:crypto_app/presenter/controllers/currency_convert/converted_currency.dart';
import 'package:crypto_app/presenter/controllers/currency_convert/to_convert_currency.dart';
import 'package:crypto_app/shared/widgets/default_error_page.dart';
import 'package:decimal/decimal.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';

import '../../../controllers/currency_convert/convert_quantity_provider.dart';
import 'button_select_converted_currency.dart';
import 'button_select_to_convert_currency.dart';
import 'container_info_balance_amount.dart';
import 'page_title.dart';

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

  String getValueHelper(Decimal value, double quantity) {
    return NumberFormat.currency(symbol: 'R\$')
        .format(
          double.parse(value.toString()) * quantity,
        )
        .replaceAll('.', ',');
  }

  final TextEditingController quantityController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final convertedCurrency = ref.watch(convertedCurrencyProvider);
    final toConvertCurrency = ref.watch(toConvertCurrencyProvider);
    final convertQuantity = ref.watch(convertQuantityProvider.state);
    final allCryptos = ref.watch(cryptosProvider);

    return allCryptos.when(
      data: (data) {
        return Center(
          child: Column(
            children: [
              const ContainerInfoBalanceAmount(),
              const PageTitle(),
              Padding(
                padding: const EdgeInsets.only(left: 16, right: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ButtonSelectConvertedCurrency(
                      cryptoEntity: convertedCurrency.crypto,
                      data: data,
                    ),
                    IconButton(
                      onPressed: () {
                        if (toConvertCurrency.id != '') {
                          final aux = convertedCurrency;
                          ref.read(convertedCurrencyProvider.notifier).state =
                              data.getWalletCryptoEntityById(toConvertCurrency);
                          ref.read(toConvertCurrencyProvider.notifier).state =
                              aux.crypto;
                        }
                      },
                      icon: ImageIcon(
                        Image.asset('assets/icons/swap.png').image,
                      ),
                    ),
                    ButtonSelectToConvertCurrency(
                      cryptoEntity: toConvertCurrency,
                      data: data,
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
                      controller: quantityController,
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(
                          RegExp(r'^(\d+)?,?\d{0,10}'),
                        ),
                      ],
                      decoration: InputDecoration(
                        helperText: getValueHelper(
                          convertedCurrency.crypto.currentPrice,
                          convertQuantity.state,
                        ),
                        helperStyle: const TextStyle(
                          color: Color.fromRGBO(117, 118, 128, 1),
                          fontSize: 15,
                        ),
                        hintText:
                            '${convertedCurrency.crypto.symbol.toUpperCase()} 0,00',
                        hintStyle: const TextStyle(
                          fontSize: 31,
                          color: Color.fromRGBO(149, 153, 166, 1),
                        ),
                      ),
                      style: const TextStyle(
                        fontSize: 31,
                        color: Color.fromRGBO(149, 153, 166, 1),
                      ),
                      onChanged: (value) {
                        if (quantityController.text != '') {
                          convertQuantity.state = double.parse(
                            quantityController.text.replaceAll(',', '.'),
                          );
                        } else {
                          convertQuantity.state = 0;
                        }
                        setState(() {});
                      },
                    ),
                    Visibility(
                      visible: quantityController.text != '' &&
                          convertQuantity.state > convertedCurrency.quantity,
                      child: const Padding(
                        padding: EdgeInsets.only(top: 8),
                        child: Text(
                          'Valor maior que o saldo disponível',
                          style: TextStyle(
                            color: Color.fromRGBO(224, 43, 87, 1),
                            fontSize: 15,
                          ),
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
