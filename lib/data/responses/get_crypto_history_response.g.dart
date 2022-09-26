// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_crypto_history_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetCryptoHistoryResponse _$GetCryptoHistoryResponseFromJson(
        Map<String, dynamic> json) =>
    GetCryptoHistoryResponse(
      prices: (json['prices'] as List<dynamic>)
          .map((e) => CryptoHistoryResponse.fromJson(e as List<dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetCryptoHistoryResponseToJson(
        GetCryptoHistoryResponse instance) =>
    <String, dynamic>{
      'prices': instance.prices,
    };
