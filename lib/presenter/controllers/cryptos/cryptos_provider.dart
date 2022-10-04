import '../../../domain/entities/wallet_entity.dart';
import '../../../shared/controllers/dio_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../data/enpoint/endpoints/get_all_cryptos_remote_endpoint_imp.dart';
import '../../../data/repository/get_all_cryptos_repository_imp.dart';
import '../../../domain/usecases/get_all_cryptos_usecase/get_all_cryptos_usecase_imp.dart';
import '../../../shared/controllers/coingecko_baseurl_provider.dart';

final cryptosDatasourceProvider = StateProvider((ref) {
  return GetAllCryptosRemoteEndpointImp(
    ref.watch(dioProvider),
    ref.watch(coingeckoBaseUrl),
  );
});

final cryptoRepositoryProvider = StateProvider((ref) {
  return GetAllCryptoRepositoryImp(ref.watch(cryptosDatasourceProvider));
});

final cryptoUsecaseProvider = StateProvider((ref) {
  return GetAllCryptosUsecaseImp(ref.watch(cryptoRepositoryProvider));
});

final cryptosProvider =
    FutureProvider.autoDispose.family<WalletEntity, String>((ref, vsCurrency) {
  return ref.watch(cryptoUsecaseProvider).getAllCryptos(vsCurrency);
});
