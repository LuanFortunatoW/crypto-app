import 'package:decimal/decimal.dart';

class CryptoEntity {
  String id;
  String image;
  String name;
  String symbol;
  Decimal currentPrice;

  CryptoEntity({
    required this.id,
    required this.image,
    required this.name,
    required this.symbol,
    required this.currentPrice,
  });
}
