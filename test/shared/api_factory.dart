import 'package:faker/faker.dart';

class ApiFactory {
  static Map<String, List<List<num>>> getCryptoHistory() {
    List<List<num>> prices = [];

    for (var i = 0; i < 90; i++) {
      prices.add(
        [
          DateTime.now().millisecondsSinceEpoch,
          faker.date.dateTime().millisecondsSinceEpoch,
          faker.currency.random.decimal(scale: 15, min: 0),
        ],
      );
    }

    return {
      "prices": prices,
    };
  }
}
