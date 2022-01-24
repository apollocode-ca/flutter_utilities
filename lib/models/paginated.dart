class Paginated {
  List data;
  int itemCount;
  int pageCount;
  List pages;

  Paginated(this.data, this.itemCount, this.pageCount, this.pages);

  factory Paginated.fromJson(Map<String, dynamic> json) {
    return Paginated(
        json['data'] as List,
        int.tryParse(json['itemCount'] != null
                ? json['itemCount']!.toString()
                : '0') ??
            0,
        int.tryParse(json['pageCount'] != null
                ? json['pageCount']!.toString()
                : '0') ??
            0,
        json['pages']);
  }
}
