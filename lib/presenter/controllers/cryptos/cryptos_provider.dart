import 'package:crypto_app/data/datasource/endpoints/get_all_crypto_endpoint.dart';
import 'package:crypto_app/domain/entities/wallet_entity.dart';
import 'package:crypto_app/shared/controllers/dio_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../data/datasource/sources/remote/get_all_cryptos_remote_datasource_imp.dart';
import '../../../data/repository/get_all_cryptos_repository_imp.dart';
import '../../../domain/usecases/get_all_cryptos_usecase/get_all_cryptos_usecase_imp.dart';

final cryptosEndpointProvider = StateProvider((ref) {
  return GetAllCryptosEndpoint(ref.watch(dioProvider));
});

final cryptosDatasourceProvider = StateProvider((ref) {
  return GetAllCryptosRemoteDatasourceImp(ref.watch(cryptosEndpointProvider));
});

final cryptoRepositoryProvider = StateProvider((ref) {
  return GetAllCryptoRepositoryImp(ref.watch(cryptosDatasourceProvider));
});

final cryptoUsecaseProvider = StateProvider((ref) {
  return GetAllCryptosUsecaseImp(ref.watch(cryptoRepositoryProvider));
});

final cryptosProvider = FutureProvider<WalletEntity>((ref) {
  return ref.watch(cryptoUsecaseProvider).getAllCryptos();
});
