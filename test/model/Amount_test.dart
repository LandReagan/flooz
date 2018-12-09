import 'package:test/test.dart';

import 'package:flooz/model/Amount.dart';
import 'package:flooz/model/Currency.dart';


void main() {

  group('Amount.fromString ctors', () {
    test('26.523 OMR', () {
      Amount amount = Amount.fromString('26.523 OMR');
      expect(amount.value, 26.523);
      expect(amount.currency.code, 'OMR');
      expect(amount.currency.precision, 3);
    });

    test('69 OMR', () {
      Amount amount = Amount.fromString('69 OMR');
      expect(amount.value, 69);
      expect(amount.currency.code, 'OMR');
      expect(amount.currency.precision, 3);
    });

    test('13.56 EUR', () {
      Amount amount = Amount.fromString('13.56 EUR');
      expect(amount.value, 13.56);
      expect(amount.currency.code, 'EUR');
      expect(amount.currency.precision, 2);  
    });    
  });
  
  group('Amount.toString method', () {
    test('13.56 EUR', () {
      Amount amount = Amount(34, Currency.fromCode('EUR'));
      expect(amount.toString(), '34.00 EUR');
    });

    test('13.56 EUR', () {
      Amount amount = Amount(34.2, Currency.fromCode('OMR'));
      expect(amount.toString(), '34.200 OMR');
    });

    test('13.56 EUR', () {
      Amount amount = Amount(34.201, Currency.fromCode('OMR'));
      expect(amount.toString(), '34.201 OMR');
    });
  });
}