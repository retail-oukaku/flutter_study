


extension StringExtension on String {

  String barcodeToIsbn() {
    if (length != 13) {
      return '';
    }
    if (int.tryParse(this) == null){
      return '';
    }
    var isbn = substring(3, 12);

    final sum = isbn.split('')
        .asMap()
        .entries
        .map((entry) => int.parse(entry.value)*(entry.key+1))
        .reduce((value, element) => value + element);

    if (sum%11 == 10) {
      isbn += 'X';
    } else {
      isbn += (sum%11).toString();
    }
    return isbn;
  }
}
