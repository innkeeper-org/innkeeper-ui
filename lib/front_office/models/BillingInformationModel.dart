import 'package:json_annotation/json_annotation.dart';

part 'BillingInformationModel.g.dart';

@JsonSerializable()
class BillingInformationModel {
  final String invoiceNumber;

  BillingInformationModel({required this.invoiceNumber});

  factory BillingInformationModel.fromJson(Map<String,dynamic> json) => _$BillingInformationModelFromJson(json);
  Map<String,dynamic> toJson() => _$BillingInformationModelToJson(this);
}