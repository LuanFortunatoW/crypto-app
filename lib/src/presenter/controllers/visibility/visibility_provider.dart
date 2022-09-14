import 'visibility_notifier.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final visibilityProvider = StateNotifierProvider<VisibilityNotifier, bool>(
    (ref) => VisibilityNotifier());
