import 'package:crypto_app/domain/entities/crypto_entity.dart';
import 'package:crypto_app/domain/entities/wallet_crypto_entity.dart';
import 'package:decimal/decimal.dart';
import 'package:faker/faker.dart';

class DefaultModels {
  static CryptoEntity cryptoModel = CryptoEntity(
    id: '',
    symbol: '',
    name: '',
    image: Faker().image.image(),
    currentPrice: Decimal.zero,
  );

  static WalletCryptoEntity walletModel = WalletCryptoEntity(
    crypto: cryptoModel,
    quantity: 0,
  );
}
