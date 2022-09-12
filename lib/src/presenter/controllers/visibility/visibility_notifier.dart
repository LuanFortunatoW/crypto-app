import 'package:hooks_riverpod/hooks_riverpod.dart';

class VisibilityNotifier extends StateNotifier<bool> {
  VisibilityNotifier() : super(true);

  void changeVisibility() {
    state = !state;
  }
}
