import 'package:crypto_app/src/domain/entities/wallet_crypto_entity.dart';
import 'package:decimal/decimal.dart';

class WalletEntity {
  List<WalletCryptoEntity> cryptos;
  WalletEntity({required this.cryptos});

  Decimal getWalletValue() {
    Decimal total = Decimal.parse('0');
    for (var crypto in cryptos) {
      total += crypto.getValueQuatityCrypto();
    }
    return total;
  }
}
