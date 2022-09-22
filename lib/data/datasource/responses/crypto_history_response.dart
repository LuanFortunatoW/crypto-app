import 'package:decimal/decimal.dart';
import 'package:json_annotation/json_annotation.dart';

part 'crypto_history_response.g.dart';

@JsonSerializable()
class CryptoHistoryResponse {
  int timeStamp;
  Decimal price;
  CryptoHistoryResponse({
    required this.timeStamp,
    required this.price,
  });

  factory CryptoHistoryResponse.fromJson(List<dynamic> json) =>
      _$CryptoHistoryResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CryptoHistoryResponseToJson(this);
}
