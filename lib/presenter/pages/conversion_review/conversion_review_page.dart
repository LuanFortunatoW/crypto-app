import 'package:crypto_app/presenter/pages/conversion_review/conversion_review_args.dart';
import 'package:flutter/material.dart';

import 'widgets/conversion_review_body.dart';

class ConversionReviewPage extends StatelessWidget {
  const ConversionReviewPage({
    Key? key,
    required this.args,
  }) : super(key: key);

  final ConversionReviewArgs args;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 1,
      ),
      body: ConversionReviewBody(args: args),
    );
  }
}
