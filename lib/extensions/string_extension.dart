

const isbnLength = 13;
const isbnStartIndex = 3;
const isbnEndIndex = 12;
const isbnCheckNumber = 11;
const isbnCheckNumberX = 10;

extension StringExtension on String {

  String barcodeToIsbn() {
    if (length != isbnLength) {
      return '';
    }
    if (int.tryParse(this) == null){
      return '';
    }
    var isbn = substring(isbnStartIndex, isbnEndIndex);

    final sum = isbn.split('')
        .asMap()
        .entries
        .map((entry) => int.parse(entry.value)*(entry.key+1))
        .reduce((value, element) => value + element);

    if (sum%isbnCheckNumber == isbnCheckX) {
      isbn += 'X';
    } else {
      isbn += (sum%isbnCheckNumber).toString();
    }
    return isbn;
  }
}
