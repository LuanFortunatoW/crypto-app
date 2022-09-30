import 'package:flutter/material.dart';

import 'animated_checkmark_widget.dart';

class ConversionConfirmationBody extends StatelessWidget {
  const ConversionConfirmationBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          AnimatedCheckmarkWidget(),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Conversão efetuada',
              style: TextStyle(
                fontSize: 34,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Text(
            'Convevrsão de moeda efetuada com sucesso!',
            style: TextStyle(
              color: Color.fromRGBO(117, 118, 128, 1),
              fontSize: 17,
            ),
          ),
        ],
      ),
    );
  }
}
