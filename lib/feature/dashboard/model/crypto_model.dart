// To parse this JSON data, do
//
//     final cryptoModel = cryptoModelFromJson(jsonString);

// ignore_for_file: constant_identifier_names

import 'dart:convert';

CryptoModel cryptoModelFromJson(String str) => CryptoModel.fromJson(json.decode(str));

String cryptoModelToJson(CryptoModel data) => json.encode(data.toJson());

class CryptoModel {
  final List<Crypto>? data;

  CryptoModel({
    this.data,
  });

  factory CryptoModel.fromJson(Map<String, dynamic> json) => CryptoModel(
    data: json["data"] == null ? [] : List<Crypto>.from(json["data"]!.map((x) => Crypto.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class Crypto {
  final String? id;
  final String? symbol;
  final String? name;
  final String? image;
  final double? currentPrice;
  final int? marketCap;
  final int? marketCapRank;
  final int? fullyDilutedValuation;
  final int? totalVolume;
  final double? high24H;
  final double? low24H;
  final double? priceChange24H;
  final double? priceChangePercentage24H;
  final double? marketCapChange24H;
  final double? marketCapChangePercentage24H;
  final double? circulatingSupply;
  final double? totalSupply;
  final double? maxSupply;
  final double? ath;
  final double? athChangePercentage;
  final DateTime? athDate;
  final double? atl;
  final double? atlChangePercentage;
  final DateTime? atlDate;
  final Roi? roi;
  final DateTime? lastUpdated;

  Crypto({
    this.id,
    this.symbol,
    this.name,
    this.image,
    this.currentPrice,
    this.marketCap,
    this.marketCapRank,
    this.fullyDilutedValuation,
    this.totalVolume,
    this.high24H,
    this.low24H,
    this.priceChange24H,
    this.priceChangePercentage24H,
    this.marketCapChange24H,
    this.marketCapChangePercentage24H,
    this.circulatingSupply,
    this.totalSupply,
    this.maxSupply,
    this.ath,
    this.athChangePercentage,
    this.athDate,
    this.atl,
    this.atlChangePercentage,
    this.atlDate,
    this.roi,
    this.lastUpdated,
  });

  factory Crypto.fromJson(Map<String, dynamic> json) => Crypto(
    id: json["id"],
    symbol: json["symbol"],
    name: json["name"],
    image: json["image"],
    currentPrice: json["current_price"]?.toDouble(),
    marketCap: json["market_cap"],
    marketCapRank: json["market_cap_rank"],
    fullyDilutedValuation: json["fully_diluted_valuation"],
    totalVolume: json["total_volume"],
    high24H: json["high_24h"]?.toDouble(),
    low24H: json["low_24h"]?.toDouble(),
    priceChange24H: json["price_change_24h"]?.toDouble(),
    priceChangePercentage24H: json["price_change_percentage_24h"]?.toDouble(),
    marketCapChange24H: json["market_cap_change_24h"]?.toDouble(),
    marketCapChangePercentage24H: json["market_cap_change_percentage_24h"]?.toDouble(),
    circulatingSupply: json["circulating_supply"]?.toDouble(),
    totalSupply: json["total_supply"]?.toDouble(),
    maxSupply: json["max_supply"]?.toDouble(),
    ath: json["ath"]?.toDouble(),
    athChangePercentage: json["ath_change_percentage"]?.toDouble(),
    athDate: json["ath_date"] == null ? null : DateTime.parse(json["ath_date"]),
    atl: json["atl"]?.toDouble(),
    atlChangePercentage: json["atl_change_percentage"]?.toDouble(),
    atlDate: json["atl_date"] == null ? null : DateTime.parse(json["atl_date"]),
    roi: json["roi"] == null ? null : Roi.fromJson(json["roi"]),
    lastUpdated: json["last_updated"] == null ? null : DateTime.parse(json["last_updated"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "symbol": symbol,
    "name": name,
    "image": image,
    "current_price": currentPrice,
    "market_cap": marketCap,
    "market_cap_rank": marketCapRank,
    "fully_diluted_valuation": fullyDilutedValuation,
    "total_volume": totalVolume,
    "high_24h": high24H,
    "low_24h": low24H,
    "price_change_24h": priceChange24H,
    "price_change_percentage_24h": priceChangePercentage24H,
    "market_cap_change_24h": marketCapChange24H,
    "market_cap_change_percentage_24h": marketCapChangePercentage24H,
    "circulating_supply": circulatingSupply,
    "total_supply": totalSupply,
    "max_supply": maxSupply,
    "ath": ath,
    "ath_change_percentage": athChangePercentage,
    "ath_date": athDate?.toIso8601String(),
    "atl": atl,
    "atl_change_percentage": atlChangePercentage,
    "atl_date": atlDate?.toIso8601String(),
    "roi": roi?.toJson(),
    "last_updated": lastUpdated?.toIso8601String(),
  };
}

class Roi {
  final double? times;
  final Currency? currency;
  final double? percentage;

  Roi({
    this.times,
    this.currency,
    this.percentage,
  });

  factory Roi.fromJson(Map<String, dynamic> json) => Roi(
    times: json["times"]?.toDouble(),
    currency: currencyValues.map[json["currency"]]!,
    percentage: json["percentage"]?.toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "times": times,
    "currency": currencyValues.reverse[currency],
    "percentage": percentage,
  };
}

enum Currency {
  BTC,
  ETH,
  USD
}

final currencyValues = EnumValues({
  "btc": Currency.BTC,
  "eth": Currency.ETH,
  "usd": Currency.USD
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
