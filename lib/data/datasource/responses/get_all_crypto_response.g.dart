// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_all_crypto_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetAllCryptosResponse _$GetAllCryptosResponseFromJson(
        Map<String, dynamic> json) =>
    GetAllCryptosResponse(
      (json['results'] as List<dynamic>)
          .map((e) => CryptoResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetAllCryptosResponseToJson(
        GetAllCryptosResponse instance) =>
    <String, dynamic>{
      'results': instance.results,
    };
