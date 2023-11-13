import 'package:flutter_test/flutter_test.dart';

import '../counter.dart';

void main() {
  // group()でテストをグルーピングできる
  group('Counter', () {
    test('Counterの初期値は0', () {
      expect(Counter().value, 0);
    });

    test('increment()を呼び出すと1増える', () {
      final counter = Counter();
      counter.increment();
      expect(counter.value, 1);
    });

    test('decrement()を呼び出すと1減る', () {
      final counter = Counter();
      counter.decrement();
      expect(counter.value, -1);
    });
  });
}
