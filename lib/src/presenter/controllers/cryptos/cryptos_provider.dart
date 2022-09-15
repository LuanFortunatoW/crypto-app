import 'package:crypto_app/src/presenter/controllers/cryptos/cryptos_notifier.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../data/datasource/sources/local/get_all_cryptos_datasource_local_imp.dart';
import '../../../data/repository/get_all_cryptos_repository_imp.dart';
import '../../../domain/entities/wallet_entity.dart';
import '../../../domain/usecases/get_all_cryptos_usecase/get_all_cryptos_usecase_imp.dart';

final cryptosDatasourceProvider = StateProvider((ref) {
  return GetAllCryptosLocalDatasourceImp();
});

final cryptoRepositoryProvider = StateProvider((ref) {
  return GetAllCryptoRepositoryImp(ref.watch(cryptosDatasourceProvider));
});

final cryptoUsecaseProvider = StateProvider((ref) {
  return GetAllCryptosUsecaseImp(ref.watch(cryptoRepositoryProvider));
});

final cryptoNotifierProvider =
    StateNotifierProvider<CryptosNotifier, WalletEntity>((ref) {
  return CryptosNotifier(ref.watch(cryptoUsecaseProvider));
});
