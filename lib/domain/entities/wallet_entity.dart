import 'package:decimal/decimal.dart';

import 'wallet_crypto_entity.dart';

class WalletEntity {
  List<WalletCryptoEntity> cryptos;
  WalletEntity({required this.cryptos});

  Decimal getWalletValue() {
    Decimal total = Decimal.zero;
    for (var crypto in cryptos) {
      total += crypto.getValueQuantityCrypto();
    }
    return total;
  }
}
