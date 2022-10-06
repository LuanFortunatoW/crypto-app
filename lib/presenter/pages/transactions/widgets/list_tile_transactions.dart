import 'package:decimal/decimal.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ListTileTransactions extends StatelessWidget {
  const ListTileTransactions({Key? key, this.conversion}) : super(key: key);
  final conversion;

  @override
  Widget build(BuildContext context) {
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
  }
}
