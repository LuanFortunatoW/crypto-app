import 'package:crypto_app/src/domain/entities/crypto_entity.dart';
import 'package:crypto_app/src/domain/entities/wallet_crypto_entity.dart';
import 'package:decimal/decimal.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final cryptoInWalletProvider = StateProvider<WalletCryptoEntity>(
  (ref) => WalletCryptoEntity(
      crypto: CryptoEntity(
        initials: '',
        image: '',
        name: '',
        price: Decimal.zero,
      ),
      quantity: 0),
);
