import 'package:crypto_app/domain/entities/crypto_entity.dart';
import 'package:crypto_app/domain/entities/wallet_crypto_entity.dart';
import 'package:decimal/decimal.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final convertedCurrencyProvider = StateProvider.autoDispose<WalletCryptoEntity>(
  (ref) {
    return WalletCryptoEntity(
      crypto: CryptoEntity(
        id: '',
        currentPrice: Decimal.zero,
        image: '',
        name: '',
        symbol: '',
      ),
      quantity: 0,
    );
  },
);
