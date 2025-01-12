import 'package:json_annotation/json_annotation.dart';

part 'generated/guest.g.dart';

@JsonSerializable()
class Guest {
  String name;
  String? phone;
  String? company;
  String? email;
  String? address;

  Guest(
      {required this.name,
      this.phone,
      this.email,
      this.company,
      this.address = "12 Ashima Vihar, Turner Road, Dehradun"});

  bool hasSearchText(String? text) {
    if (text == null || text.isEmpty) return true;
    return name.contains(text) ||
        phone?.contains(text) == true ||
        company?.contains(text) == true;
  }

  factory Guest.fromJson(Map<String, dynamic> json) => _$GuestFromJson(json);
  Map<String, dynamic> toJson() => _$GuestToJson(this);
}
