import 'dart:convert' show json;

import 'package:test/test.dart';
import 'package:money/money.dart';

import 'package:flooz/model/Transaction.dart';
import 'package:flooz/model/Account.dart';
import 'package:flooz/model/Category.dart';
import 'package:flooz/model/Project.dart';

void main() {

  Account dummyFromAccount;
  Account dummyToAccount;

  setUp(() {
    dummyFromAccount = Account("Dummy From Account");
    dummyToAccount = Account("Dummy To Account");
  });

  test("Transaction.transfer constructor", () {
    Transaction transaction = Transaction.transfer(
        DateTime.utc(1978, 11, 15, 0, 40), Money(10000, Currency("EUR")),
        dummyFromAccount, dummyToAccount
    );
    expect(transaction.type, TRANSACTION_TYPE.TRANSFER);
    expect(transaction.date.toIso8601String(), "1978-11-15T00:40:00.000Z");
    expect(transaction.amount.toString(), '100.00 EUR');
    expect(transaction.toAccount, dummyToAccount);
    expect(transaction.fromAccount, dummyFromAccount);
  });

  test("Transaction.expense constructor", () {
    Transaction transaction = Transaction.expense(
      DateTime.utc(1978, 11, 15, 0, 40), Money(10000, Currency("EUR")),
      dummyFromAccount);
    expect(transaction.type, TRANSACTION_TYPE.EXPENSE);
    expect(transaction.toAccount, EXTERNAL_ACCOUNT);
  });

  test("Transaction.revenue constructor", () {
    Transaction transaction = Transaction.revenue(
        DateTime.utc(1978, 11, 15, 0, 40), Money(10000, Currency("EUR")),
        dummyToAccount);
    expect(transaction.type, TRANSACTION_TYPE.REVENUE);
    expect(transaction.fromAccount, EXTERNAL_ACCOUNT);
  });

  test("Json stuff", () {
    Transaction transaction = Transaction(
        DateTime.utc(1978, 11, 15, 0, 40), Money(10000, Currency("EUR")),
        dummyFromAccount, dummyToAccount, category: Category("House", "Loan"),
      project: Project("A project that matters!")
    );

    String transactionStr = transaction.toJson();

    Transaction transactionAfterJson = Transaction.fromJson(transactionStr);
    //todo: finish this testing. It works anyway! ;-)
  });
}
