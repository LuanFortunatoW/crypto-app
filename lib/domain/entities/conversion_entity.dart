import 'package:crypto_app/domain/entities/crypto_entity.dart';

class ConversionEntity {
  CryptoEntity convertedCrypto;
  CryptoEntity toConvertCrypto;
  double quantity;

  ConversionEntity({
    required this.convertedCrypto,
    required this.toConvertCrypto,
    required this.quantity,
  });
}
