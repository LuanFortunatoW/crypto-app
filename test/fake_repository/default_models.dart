import 'package:crypto_app/domain/entities/conversion_entity.dart';
import 'package:crypto_app/domain/entities/crypto_entity.dart';
import 'package:crypto_app/domain/entities/wallet_crypto_entity.dart';
import 'package:crypto_app/presenter/pages/conversion_review/conversion_review_args.dart';
import 'package:crypto_app/presenter/pages/convert_%20currency/convert_currency_args.dart';
import 'package:crypto_app/presenter/pages/crypto_info/crypto_info_args.dart';
import 'package:decimal/decimal.dart';
import 'package:faker/faker.dart';

class DefaultModels {
  static CryptoEntity cryptoModelBTC = CryptoEntity(
    id: 'bitcoin',
    symbol: 'btc',
    name: 'Bitcoin',
    image: Faker().image.image(),
    currentPrice: Decimal.one,
  );
  static CryptoEntity cryptoModelETH = CryptoEntity(
    id: 'ethereum',
    symbol: 'eth',
    name: 'Ethereum',
    image: Faker().image.image(),
    currentPrice: Decimal.one,
  );

  static WalletCryptoEntity walletModelBTC = WalletCryptoEntity(
    crypto: cryptoModelBTC,
    quantity: 10,
  );
  static WalletCryptoEntity walletModelETH = WalletCryptoEntity(
    crypto: cryptoModelETH,
    quantity: 10,
  );

  static ConversionEntity conversionEntity = ConversionEntity(
    convertedCrypto: cryptoModelBTC,
    toConvertCrypto: cryptoModelETH,
    quantity: 2,
    date: DateTime.now(),
  );

  static List<ConversionEntity> allTransactions = [
    conversionEntity,
    conversionEntity,
    conversionEntity,
  ];

  static CryptoInfoArgs cryptoInfoArgs =
      CryptoInfoArgs(walletCryptoEntity: walletModelBTC);

  static ConvertCurrencyArgs convertCurrencyArgs =
      ConvertCurrencyArgs(walletCryptoEntity: walletModelBTC);

  static ConversionReviewArgs conversionReviewArgs =
      ConversionReviewArgs(conversionEntity: conversionEntity);
}
