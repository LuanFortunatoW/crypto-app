import 'package:decimal/decimal.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../domain/entities/crypto_entity.dart';
import '../../../domain/entities/wallet_crypto_entity.dart';

final cryptoInWalletProvider = StateProvider<WalletCryptoEntity>(
  (ref) => WalletCryptoEntity(
      crypto: CryptoEntity(
        id: '',
        symbol: '',
        image: '',
        name: '',
        currentPrice: Decimal.zero,
      ),
      quantity: 0),
);
