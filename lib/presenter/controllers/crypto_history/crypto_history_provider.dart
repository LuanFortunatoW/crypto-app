import 'package:crypto_app/presenter/controllers/crypto_history/crypto_history_notifier.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../data/datasource/sources/local/get_crypto_history_datasource_local_imp.dart';
import '../../../data/repository/get_crypto_history_repository_imp.dart';
import '../../../domain/entities/crypto_entity.dart';
import '../../../domain/usecases/get_crypto_history/get_crypto_history_usecase_imp.dart';

final cryptoHistoryDatasourceProvider = StateProvider(
  (ref) {
    return GetCryptoHistoryDatasourceLocalImp();
  },
);

final cryptoHistoryRepositoryProvider = StateProvider(
  (ref) {
    return GetCryptoHistoryRepositoryImp(
        ref.watch(cryptoHistoryDatasourceProvider));
  },
);

final cryptoHistoryUsecaseProvider = StateProvider(
  (ref) {
    return GetCryptoHistoryUsecaseImp(
        ref.watch(cryptoHistoryRepositoryProvider));
  },
);

final cryptoHistoryProvider =
    StateNotifierProvider<CryptoHistoryNotifier, Map<DateTime, CryptoEntity>>(
  (ref) {
    return CryptoHistoryNotifier(ref.watch(cryptoHistoryUsecaseProvider));
  },
);
