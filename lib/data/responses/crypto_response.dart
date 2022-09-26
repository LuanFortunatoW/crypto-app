import 'package:decimal/decimal.dart';
import 'package:json_annotation/json_annotation.dart';
part 'crypto_response.g.dart';

@JsonSerializable()
class CryptoResponse {
  final String id;
  final String symbol;
  final String name;
  final String image;
  final Decimal currentPrice;

  CryptoResponse(
    this.id,
    this.symbol,
    this.name,
    this.image,
    this.currentPrice,
  );

  factory CryptoResponse.fromJson(Map<String, dynamic> json) =>
      _$CryptoResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CryptoResponseToJson(this);
}
