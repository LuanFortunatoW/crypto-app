import 'package:crypto_app/src/data/datasource/sources/local/get_crypto_history_datasource_local_imp.dart';
import 'package:crypto_app/src/data/repository/get_crypto_history_repository_imp.dart';
import 'package:crypto_app/src/domain/entities/crypto_entity.dart';
import 'package:crypto_app/src/domain/usecases/get_crypto_history/get_crypto_history_usecase_imp.dart';
import 'package:crypto_app/src/presenter/controllers/crypto_history/crypto_history_notifier.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

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
