import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../controllers/visibility_provider.dart';

class ButtonChangeVisibility extends HookConsumerWidget {
  const ButtonChangeVisibility({
    Key? key,
  }) : super(// coverage:ignore-line
          key: key,
        );

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final visibility = ref.watch(visibilityProvider.state);
    return IconButton(
      onPressed: () => visibility.state = !visibility.state,
      icon: visibility.state
          ? const Icon(Icons.visibility)
          : const Icon(Icons.visibility_off),
    );
  }
}
