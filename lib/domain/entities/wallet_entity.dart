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

  CryptoEntity getFirstDiferentCrypto(CryptoEntity cryptoEntity) {
    for (var walletCryptoEntity in cryptos) {
      if (walletCryptoEntity.crypto.id != cryptoEntity.id) {
        return walletCryptoEntity.crypto;
      }
    }
    return cryptoEntity;
  }

  WalletCryptoEntity getWalletCryptoEntityById(CryptoEntity cryptoEntity) {
    return cryptos
        .where((walletCryptoEntity) =>
            walletCryptoEntity.crypto.id == cryptoEntity.id)
        .first;
  }
}
