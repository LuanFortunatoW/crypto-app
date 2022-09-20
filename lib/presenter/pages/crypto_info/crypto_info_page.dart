import 'package:crypto_app/presenter/pages/crypto_info/widgets/crypto_info_chart.dart';
import 'package:flutter/material.dart';

import 'widgets/button_convert_currency.dart';
import 'widgets/divider_crypto_info.dart';
import 'widgets/row_crypto_infos.dart';
import 'widgets/row_current_price.dart';
import 'widgets/row_last_day_variation.dart';
import 'widgets/row_quantity_in_wallet.dart';
import 'widgets/row_value_in_wallet.dart';

class CryptoInfoPage extends StatelessWidget {
  const CryptoInfoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        title: const Text(
          'Detalhes',
          style: TextStyle(
            fontSize: 21,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          child: Column(
            children: const [
              RowCryptoInfos(),
              Padding(
                padding: EdgeInsets.only(
                  top: 16,
                  left: 16,
                  right: 16,
                ),
                child: CryptoInfoChart(),
              ),
              DividerCryptoInfo(),
              RowCurrentPrice(),
              DividerCryptoInfo(),
              RowLastDayVariation(),
              DividerCryptoInfo(),
              RowQuantityInWallet(),
              DividerCryptoInfo(),
              RowValueInWallet(),
              ButtonConvertCurrency(),
            ],
          ),
        ),
      ),
    );
  }
}
