import 'package:crypto_app/domain/entities/conversion_entity.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'default_models.dart';

final fakeAllTransactionsProvider = StateProvider<List<ConversionEntity>>(
    (ref) => DefaultModels.allTransactions);
