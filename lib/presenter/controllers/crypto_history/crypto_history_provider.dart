import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../data/enpoint/endpoints/get_crypto_history_remote_endpoint_imp.dart';
import '../../../data/repository/get_crypto_history_repository_imp.dart';
import '../../../domain/entities/crypto_history_entity.dart';
import '../../../domain/usecases/get_crypto_history/get_crypto_history_usecase_imp.dart';
import '../../../shared/controllers/coingecko_baseurl_provider.dart';
import '../../../shared/controllers/dio_provider.dart';

final cryptoHistoryDatasourceProvider = StateProvider(
  (ref) {
    return GetCryptoHistoryRemoteEndpointImp(
      ref.watch(dioProvider),
      ref.watch(coingeckoBaseUrl),
    );
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

final cryptoHistoryProvider = FutureProvider.autoDispose
    .family<List<CryptoHistoryEntity>, String>((ref, id) =>
        ref.read(cryptoHistoryUsecaseProvider).getCryptoHistory(id));
