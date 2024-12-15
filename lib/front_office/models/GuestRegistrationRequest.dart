import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class GuestRegistrationRequest {
  String name;
  String? phone;
  String? company;
  String? email;
  GuestRegistrationRequest({
    required this.name
  });
}