import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../domain/entities/conversion_entity.dart';

final allTransactionsProvider =
    StateProvider<List<ConversionEntity>>((ref) => []);
