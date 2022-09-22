import 'dart:math';

import 'package:crypto_app/domain/entities/crypto_entity.dart';
import 'package:crypto_app/domain/entities/wallet_crypto_entity.dart';
import 'package:crypto_app/domain/entities/wallet_entity.dart';

import '../responses/get_all_crypto_response.dart';

extension GetAllCryptosMapper on GetAllCryptosResponse {
  WalletEntity toViewData() {
    return WalletEntity(
        cryptos: results
            .map((e) => WalletCryptoEntity(
                crypto: CryptoEntity(
                    id: e.id,
                    symbol: e.symbol,
                    image: e.image,
                    name: e.name,
                    currentPrice: e.currentPrice),
                quantity: Random().nextDouble() * 10))
            .toList());
  }
}
