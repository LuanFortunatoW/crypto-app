import 'dart:math';

import 'package:crypto_app/domain/entities/crypto_entity.dart';
import 'package:crypto_app/domain/entities/wallet_crypto_entity.dart';
import 'package:crypto_app/domain/entities/wallet_entity.dart';

import '../../data/responses/get_all_crypto_response.dart';

extension GetAllCryptosMapper on GetAllCryptosResponse {
  WalletEntity toViewData() {
    return WalletEntity(
        cryptos: results
            .map((crypto) => WalletCryptoEntity(
                crypto: CryptoEntity(
                    id: crypto.id,
                    symbol: crypto.symbol,
                    image: crypto.image,
                    name: crypto.name,
                    currentPrice: crypto.currentPrice),
                quantity: Random().nextDouble() * 10))
            .toList());
  }
}
