import '../../../domain/entities/crypto_entity.dart';
import 'package:decimal/decimal.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../domain/entities/wallet_crypto_entity.dart';

final toConvertCurrencyProvider = StateProvider.autoDispose<WalletCryptoEntity>(
  (ref) {
    return WalletCryptoEntity(
        crypto: CryptoEntity(
          id: '',
          image: 'https://static.thenounproject.com/png/1632630-200.png',
          name: '',
          symbol: 'COIN',
          currentPrice: Decimal.zero,
        ),
        quantity: 0);
  },
);
