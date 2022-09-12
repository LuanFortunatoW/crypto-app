import 'package:crypto_app/src/domain/entities/crypto_entity.dart';
import 'package:decimal/decimal.dart';

class WalletCryptoEntity {
  double quantity;
  CryptoEntity crypto;

  WalletCryptoEntity({
    required this.crypto,
    required this.quantity,
  });

  Decimal getValueQuatityCrypto() {
    double cryptoValue = quantity * crypto.price.toDouble();
    return Decimal.parse('$cryptoValue');
  }
}
