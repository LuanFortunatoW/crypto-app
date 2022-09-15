import 'package:decimal/decimal.dart';

import 'crypto_entity.dart';

class WalletCryptoEntity {
  double quantity;
  CryptoEntity crypto;

  WalletCryptoEntity({
    required this.crypto,
    required this.quantity,
  });

  Decimal getValueQuantityCrypto() {
    double cryptoValue = quantity * crypto.price.toDouble();
    return Decimal.parse('$cryptoValue');
  }
}