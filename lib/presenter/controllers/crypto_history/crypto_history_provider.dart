import 'package:crypto_app/data/datasource/endpoints/get_crypto_history_endpoint.dart';
import 'package:crypto_app/domain/entities/crypto_history_entity.dart';
import 'package:crypto_app/shared/controllers/dio_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../data/datasource/sources/remote/get_crypto_history_remote_datasource_imp.dart';
import '../../../data/repository/get_crypto_history_repository_imp.dart';
import '../../../domain/usecases/get_crypto_history/get_crypto_history_usecase_imp.dart';

final cryptoHistoryEndpointProvider = StateProvider(
  (ref) {
    return GetCryptoHistoryEndpoint(ref.watch(dioProvider));
  },
);

final cryptoHistoryDatasourceProvider = StateProvider(
  (ref) {
    return GetCryptoHistoryRemoteDatasourceImp(
        ref.watch(cryptoHistoryEndpointProvider));
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
    FutureProvider.family<List<CryptoHistoryEntity>, String>((ref, id) =>
        ref.read(cryptoHistoryUsecaseProvider).getCryptoHistory(id));
