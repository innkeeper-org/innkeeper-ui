import 'package:json_annotation/json_annotation.dart';

part 'generated/guest_information_model.g.dart';

@JsonSerializable()
class GuestInformationModel {
  String name;
  String phone;
  String? company;
  String email;

  GuestInformationModel(
      {required this.name, required this.phone, required this.email});

  factory GuestInformationModel.fromJson(Map<String, dynamic> json) =>
      _$GuestInformationModelFromJson(json);
  Map<String, dynamic> toJson() => _$GuestInformationModelToJson(this);
}
