import 'package:crypto_app/shared/widgets/app_bar_app.dart';

import 'conversion_review_args.dart';
import 'package:flutter/material.dart';

import 'widgets/conversion_review_body.dart';

class ConversionReviewPage extends StatelessWidget {
  const ConversionReviewPage({
    Key? key,
    required this.args,
  }) : super(key: key);

  final ConversionReviewArgs args;
  static const route = '/conversion_review';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarApp(
        title: '',
        visibility: false,
      ),
      body: ConversionReviewBody(args: args),
    );
  }
}
