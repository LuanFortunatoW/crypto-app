import 'package:crypto_app/src/presenter/view/shared/controllers/pages/page_notifier.dart';
import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final pageProvider =
    StateNotifierProvider<PageNotifier, Widget>((ref) => PageNotifier());
