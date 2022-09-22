import 'package:decimal/decimal.dart';

class CryptoHistoryEntity {
  int timeStamp;
  Decimal price;

  CryptoHistoryEntity({
    required this.timeStamp,
    required this.price,
  });
}
