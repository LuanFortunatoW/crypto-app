import 'package:decimal/decimal.dart';

class CryptoEntity {
  String image;
  String name;
  String initials;
  Decimal price;

  CryptoEntity({
    required this.initials,
    required this.image,
    required this.name,
    required this.price,
  });
}
