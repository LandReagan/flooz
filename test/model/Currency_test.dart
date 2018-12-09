import 'package:test/test.dart';

import 'package:flooz/model/Currency.dart';


void main() {

  test('Currency.fromCode ctor', () {
    var omr = Currency.fromCode('OMR');
    expect(omr.code, 'OMR');
    expect(omr.precision, 3);
  });
}