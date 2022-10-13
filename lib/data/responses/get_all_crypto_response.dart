import 'package:json_annotation/json_annotation.dart';

import 'crypto_response.dart';

part 'get_all_crypto_response.g.dart';

@JsonSerializable()
class GetAllCryptosResponse {
  final List<CryptoResponse> results;

  GetAllCryptosResponse(this.results);

  factory GetAllCryptosResponse.fromJson(Map<String, dynamic> json) =>
      _$GetAllCryptosResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetAllCryptosResponseToJson(this);
}
