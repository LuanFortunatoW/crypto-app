import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../portfolio/presenter/view/portfolio/widgets/body_portifolio_page.dart';
import '../../../transactions/presenter/view/widgets/body_transactions_page.dart';

class PageNotifier extends StateNotifier<Widget> {
  PageNotifier() : super(const BodyPortifolioPage());

  int index = 0;

  final List<Widget> pages = [
    const BodyPortifolioPage(),
    const BodyTransactionsPage()
  ];

  void changePage(int index) {
    this.index = index;
    state = pages[this.index];
  }
}
