import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../controllers/visibility/visibility_provider.dart';

class ButtonChangeVisibility extends HookConsumerWidget {
  const ButtonChangeVisibility({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return IconButton(
      onPressed: () => ref.read(visibilityProvider.notifier).changeVisibility(),
      icon: const Icon(Icons.remove_red_eye),
    );
  }
}
