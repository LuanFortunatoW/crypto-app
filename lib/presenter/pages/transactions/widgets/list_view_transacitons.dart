import 'package:decimal/decimal.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';

import '../../../../domain/entities/conversion_entity.dart';
import '../../../controllers/transactions/all_transactions_provider.dart';

class ListViewTransacitons extends HookConsumerWidget {
  const ListViewTransacitons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final transactions = ref.watch(allTransactionsProvider);

    return Expanded(
      child: ListView.separated(
        itemCount: transactions.length,
        separatorBuilder: (context, index) {
          return const Divider(
            indent: 16,
            height: 10,
            thickness: 1,
          );
        },
        itemBuilder: (context, index) {
          ConversionEntity conversion = transactions[index];
          return ListTile(
            title: Text(
              '${conversion.quantity} ${conversion.convertedCrypto.symbol.toUpperCase()}',
              style: const TextStyle(
                fontSize: 19,
                color: Color.fromRGBO(117, 118, 128, 1),
              ),
            ),
            subtitle: Text(
              DateFormat.yMd().format(conversion.date).toString(),
              style: const TextStyle(
                fontSize: 15,
                color: Color.fromRGBO(117, 118, 128, 1),
              ),
            ),
            trailing: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  '${(Decimal.parse(conversion.quantity.toString()) * conversion.convertedCrypto.currentPrice / conversion.toConvertCrypto.currentPrice).toDecimal(
                    toBigInt: (p0) => p0.toBigInt(),
                    scaleOnInfinitePrecision: 8,
                  )} ${conversion.toConvertCrypto.symbol.toUpperCase()}',
                  style: const TextStyle(
                    fontSize: 19,
                  ),
                ),
                Text(
                  NumberFormat.currency(
                    symbol: 'R\$ ',
                    decimalDigits: 2,
                  ).format(
                    (Decimal.parse(conversion.quantity.toString()) *
                            conversion.convertedCrypto.currentPrice)
                        .toDouble(),
                  ),
                  style: const TextStyle(
                    fontSize: 15,
                    color: Color.fromRGBO(117, 118, 128, 1),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
