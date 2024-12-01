import 'package:json_annotation/json_annotation.dart';

part 'guest.g.dart';

@JsonSerializable()
class Guest {
  String name;
  String? phone;
  String? company;

  Guest({
    required this.name
  });

  bool hasSearchText(String? text) {
    if(text == null || text.isEmpty) return true;
    return name.contains(text) ||
        phone?.contains(text) == true ||
        company?.contains(text) == true;
  }
  factory Guest.fromJson(Map<String, dynamic> json) => _$GuestFromJson(json);
  Map<String, dynamic> toJson() => _$GuestToJson(this);
}

