import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'convert_validation_notifier.dart';

final convertValidationProvider =
    StateNotifierProvider.autoDispose<ConvertValidationNotifier, bool>(
  (ref) => ConvertValidationNotifier(),
);
