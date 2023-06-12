


extension StringExtension on String {
  bool cnIsNumber() {
    final reg = RegExp(r'^-?[0-9.]+$');
    return reg.hasMatch(this);
  }
  String barcodeToIsbn() {
    if (length != 13) {
      return '';
    }
    if (int.tryParse(this) == null){
      return '';
    }
    var isbn = substring(3, 12);
    var sum = 0;
    for (var i = 0; i < isbn.length; i++){
      final number = int.parse(isbn.substring(i, i+1));
      sum += number*(i+1);
    }

    if (sum%11 == 10) {
      isbn += 'X';
    } else {
      isbn += (sum%11).toString();
    }
    return isbn;
  }
}
