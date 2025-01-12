import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class Property {
  final String name;
  Property({required this.name});
}
