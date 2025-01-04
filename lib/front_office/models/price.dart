import 'package:json_annotation/json_annotation.dart';

part 'price.g.dart';

@JsonSerializable()
class Price {
  String? hsnCode;
  double priceWithoutTax;
  double discountRate;
  double taxRate;

  Price({
    this.hsnCode,
    required this.priceWithoutTax,
    required this.discountRate,
    required this.taxRate
});

  double getAmount() {
    double netPBT = priceWithoutTax * (1 - discountRate / 100);
    double pAT = netPBT * (1 + taxRate / 100);
    return pAT;
  }

  @override
  String toString() {
    return getAmount().toString();
  }

  factory Price.fromJson(Map<String, dynamic> json) => _$PriceFromJson(json);
  Map<String, dynamic> toJson() => _$PriceToJson(this);
}