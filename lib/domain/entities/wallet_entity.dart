import 'crypto_entity.dart';
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

  WalletCryptoEntity getWalletCryptoEntityById(CryptoEntity cryptoEntity) {
    return cryptos
        .where((walletCryptoEntity) =>
            walletCryptoEntity.crypto.id == cryptoEntity.id)
        .first;
  }
}
