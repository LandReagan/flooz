import 'package:test/test.dart';

import 'package:flooz/model/Account.dart';


void main() {
  test("Account minimal constructor", () {
    Account account = Account("My Dummy Bank Account");
    expect(account.alias, "My Dummy Bank Account");
    expect(account.number, "0");
    expect(account.type, ACCOUNT_TYPES.OTHER);
    expect(account.owner, "Unknown");
    expect(account.external, false);
  });

  test("Account.external() factory constructor", () {
    Account account = EXTERNAL_ACCOUNT;
    expect(account.external, true);
    expect(account.alias, "EXTERNAL");
  });

  test("operator ==", () {
    Account account1 = Account("Account1");
    Account account2 = Account("Account2");
    expect(account1 == account2, false);
    Account account3 = Account("Account1");
    expect(actual, matcher)
  });
}
