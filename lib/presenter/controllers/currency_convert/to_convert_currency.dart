import 'package:crypto_app/domain/entities/crypto_entity.dart';
import 'package:decimal/decimal.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final toConvertCurrencyProvider = StateProvider.autoDispose<CryptoEntity>(
  (ref) {
    return CryptoEntity(
      id: '',
      image: 'https://static.thenounproject.com/png/1632630-200.png',
      name: '',
      symbol: 'COIN',
      currentPrice: Decimal.zero,
    );
  },
);
