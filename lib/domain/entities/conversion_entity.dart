import 'crypto_entity.dart';

class ConversionEntity {
  CryptoEntity convertedCrypto;
  CryptoEntity toConvertCrypto;
  double quantity;
  DateTime date;

  ConversionEntity({
    required this.convertedCrypto,
    required this.toConvertCrypto,
    required this.quantity,
    required this.date,
  });
}
