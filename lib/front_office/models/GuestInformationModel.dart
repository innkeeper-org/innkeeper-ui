import 'package:json_annotation/json_annotation.dart';

part 'GuestInformationModel.g.dart';

@JsonSerializable()
class GuestInformationModel {
  final String name;
  final String phone;
  String? company;
  final String email;

  GuestInformationModel(
      {required this.name, required this.phone, required this.email});

  factory GuestInformationModel.fromJson(Map<String,dynamic> json) => _$GuestInformationModelFromJson(json);
  Map<String,dynamic> toJson() => _$GuestInformationModelToJson(this);
}
