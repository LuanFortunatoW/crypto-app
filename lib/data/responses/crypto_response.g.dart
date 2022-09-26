// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'crypto_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CryptoResponse _$CryptoResponseFromJson(Map<String, dynamic> json) =>
    CryptoResponse(
      json['id'] as String,
      json['symbol'] as String,
      json['name'] as String,
      json['image'] as String,
      Decimal.parse(json['current_price'].toString()),
    );

Map<String, dynamic> _$CryptoResponseToJson(CryptoResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'symbol': instance.symbol,
      'name': instance.name,
      'image': instance.image,
      'currentPrice': instance.currentPrice,
    };
