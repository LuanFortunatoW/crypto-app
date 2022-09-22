// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'crypto_history_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CryptoHistoryResponse _$CryptoHistoryResponseFromJson(List<dynamic> json) =>
    CryptoHistoryResponse(
      timeStamp: json[0] as int,
      price: Decimal.parse(json[1].toString()),
    );

Map<String, dynamic> _$CryptoHistoryResponseToJson(
        CryptoHistoryResponse instance) =>
    <String, dynamic>{
      'timeStamp': instance.timeStamp,
      'price': instance.price,
    };
