import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class Address {
  String? number;
  String? street;
  String? apt;
  String? city;
  String? province;
  String? zipCode;

  Address(
      {this.street,
      this.number,
      this.apt,
      this.city,
      this.zipCode,
      this.province});

  factory Address.fromJson(Map<String, dynamic> json) {
    return Address(
        street: json['street'] ?? '',
        number: json['number'] ?? '',
        apt: json['apt'] ?? '',
        city: json['city'] ?? '',
        zipCode: json['zipCode'] ?? '',
        province: json['province'] ?? '');
  }

  Map<String, dynamic> toJson() {
    return {
      'street': street,
      'number': number,
      'apt': apt,
      'city': city,
      'province': province,
      'zip_code': zipCode,
    };
  }

  @override
  String toString() {
    return '${(apt != null && apt != "") ? apt! + "-" : ""}$number $street, $city, $province, $zipCode';
  }

  static bool validateZipCode(String zipCode) {
    RegExp regExp = RegExp(r'^[A-Za-z]\d[A-Za-z] \d[A-Za-z]\d$');
    return regExp.hasMatch(zipCode);
  }

  static var zipFormatter = MaskTextInputFormatter(
      mask: 'A#A #A#',
      filter: {"#": RegExp(r'[0-9]'), "A": RegExp(r'[aA-zZ]')});
}
