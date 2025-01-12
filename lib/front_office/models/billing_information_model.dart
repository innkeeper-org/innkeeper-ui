import 'package:json_annotation/json_annotation.dart';

part 'billing_information_model.g.dart';

@JsonSerializable()
class BillingInformationModel {
  String invoiceNumber;

  BillingInformationModel({required this.invoiceNumber});

  factory BillingInformationModel.fromJson(Map<String, dynamic> json) =>
      _$BillingInformationModelFromJson(json);
  Map<String, dynamic> toJson() => _$BillingInformationModelToJson(this);
}
