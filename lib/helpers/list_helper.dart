class ListHelper {
  static String toCSV(List<dynamic> list) {
    var csvString = "";

    for (var i = 0; i < list.length; i++) {
      csvString += list[i].toString() + ((i != list.length - 1) ? ':' : '');
    }

    return csvString;
  }
}
