import 'package:json_annotation/json_annotation.dart';

import 'crypto_history_response.dart';
part 'get_crypto_history_response.g.dart';

@JsonSerializable()
class GetCryptoHistoryResponse {
  List<CryptoHistoryResponse> prices;

  GetCryptoHistoryResponse({required this.prices});

  factory GetCryptoHistoryResponse.fromJson(Map<String, dynamic> json) =>
      _$GetCryptoHistoryResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetCryptoHistoryResponseToJson(this);
}
