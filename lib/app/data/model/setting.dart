import 'package:meta/meta.dart';

class Setting {
  Setting({
    @required this.currencies,
  });

  List<Currency> currencies;

  factory Setting.fromJson(Map<String, dynamic> json) => Setting(
        currencies: List<Currency>.from(
            json["currency"].map((x) => Currency.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "currencies": List<dynamic>.from(currencies.map((x) => x.toJson())),
      };
}

class Currency {
  Currency({
    @required this.id,
    @required this.name,
    @required this.isMain,
    @required this.exchangeRate,
  });

  int id;
  String name;
  int isMain;
  double exchangeRate;

  Currency copyWith({
    int id,
    String name,
    int isMain,
    double exchangeRate,
  }) =>
      Currency(
        id: id ?? this.id,
        name: name ?? this.name,
        isMain: isMain ?? this.isMain,
        exchangeRate: exchangeRate ?? this.exchangeRate,
      );

  factory Currency.fromJson(Map<String, dynamic> json) => Currency(
        id: json["id"],
        name: json["name"],
        isMain: json["is_main"],
        exchangeRate: json["exchange_rate"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "is_main": isMain,
        "exchange_rate": exchangeRate,
      };
}
