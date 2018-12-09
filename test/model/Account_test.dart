import 'package:test/test.dart';

import 'package:flooz/model/Account.dart';


void main() {

  test('Minimal ctor', () {
    Account account = Account('123');
    expect(account.id, '123');
    expect(account.name, 'NO_NAME');
    expect(account.initialAmount.toString(), '0.00 USD');
    expect(account.currency.code, 'USD');
  });

  test('Outside account', () {
    Account outsideAccount = Account.outside('EUR');
    expect(outsideAccount.id, null);
    expect(outsideAccount.initialAmount.value, 0.0);
    expect(outsideAccount.name, 'Outside');
    expect(outsideAccount.currency.code, 'EUR');
  });
}