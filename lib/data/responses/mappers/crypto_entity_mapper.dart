import 'dart:math';

import '../../../domain/entities/crypto_entity.dart';
import '../../../domain/entities/wallet_crypto_entity.dart';
import '../../../domain/entities/wallet_entity.dart';
import '../get_all_crypto_response.dart';

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
