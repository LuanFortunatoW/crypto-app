import 'package:faker/faker.dart';

class ApiFactory {
  static Map<String, dynamic> getCryptoHistory() {
    final prices = [];

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

  static List<Map<String, dynamic>> getAllCryptos() {
    List<Map<String, dynamic>> cryptos = [];

    for (var i = 0; i < 90; i++) {
      cryptos.add(
        {
          "id": faker.lorem.toString(),
          "symbol": faker.lorem.toString(),
          "name": faker.lorem.toString(),
          "image": faker.image.image(),
          "current_price": faker.randomGenerator.integer(100000),
          "market_cap": faker.randomGenerator.integer(10000000),
          "market_cap_rank": faker.randomGenerator.integer(1000),
          "fully_diluted_valuation": faker.randomGenerator.integer(10000000),
          "total_volume": faker.randomGenerator.integer(10000000),
          "high_24h": faker.randomGenerator.integer(1000000),
          "low_24h": faker.randomGenerator.integer(1000000),
          "price_change_24h": faker.currency.random.decimal(),
          "price_change_percentage_24h": faker.currency.random.decimal(),
          "market_cap_change_24h": faker.currency.random.decimal(),
          "market_cap_change_percentage_24h": faker.currency.random.decimal(),
          "circulating_supply": faker.randomGenerator.integer(10000000),
          "total_supply": faker.randomGenerator.integer(10000000),
          "max_supply": faker.randomGenerator.integer(10000000),
          "ath": faker.randomGenerator.integer(1000000),
          "ath_change_percentage": faker.currency.random.decimal(),
          "ath_date": faker.date.dateTime().toUtc().toString(),
          "atl": faker.currency.random.decimal(),
          "atl_change_percentage": faker.currency.random.decimal(),
          "atl_date": faker.date.dateTime().toUtc().toString(),
          "roi": null,
          "last_updated": faker.date.dateTime().toUtc().toString(),
        },
      );
    }

    return cryptos;
  }
}
