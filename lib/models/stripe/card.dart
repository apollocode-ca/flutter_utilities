class CreditCard {
  String? id;
  String? type;
  String? country;
  int? expMonth;
  int? expYear;
  String? last4;
  String? token;
  String? name;

  String? expiration;
  String? number;
  String? ccv;

  CreditCard(
      {this.id,
      this.type,
      this.country,
      this.expMonth,
      this.expYear,
      this.last4,
      this.token,
      this.name,
      this.expiration,
      this.number,
      this.ccv});
  factory CreditCard.fromJson(Map<String, dynamic> json) {
    return CreditCard(
      id: json['id'] ?? '',
      type: json['type'] ?? '',
      country: json['country'] ?? '',
      expMonth: json['exp_month'] ?? 0,
      expYear: json['exp_year'] ?? 0,
      last4: json['last4'] ?? '',
      token: json['token'] ?? '',
      name: json['name'] ?? '',
      expiration: json['expiration'] ?? '',
      number: json['number'] ?? '',
      ccv: json['ccv'] ?? '',
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'type': type,
        'country': country,
        'name': name,
        'expMonth': expMonth,
        'expYear': expYear,
        'last4': last4,
        'token': token,
        'expiration': expiration,
        'number': number,
        'ccv': ccv,
      };
}
