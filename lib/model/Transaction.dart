import 'dart:convert' show json;

import 'package:money/money.dart';

import 'package:flooz/model/Account.dart' show Account, EXTERNAL_ACCOUNT;
import 'package:flooz/model/Category.dart' show Category, UNKNOWN_CATEGORY;
import 'package:flooz/model/Project.dart' show Project, UNKNOWN_PROJECT;
import 'package:flooz/tools/Jsonizable.dart' show Jsonizable;

enum TRANSACTION_TYPE {
  TRANSFER,
  EXPENSE,
  REVENUE
}

/// Transaction class to define a bank [Transaction], either from or to
/// external accounts, or between internal accounts.
///
/// Types of transactions:
/// - Transfers are between internal accounts, use [Transaction.transfer] ctor,
/// - Expenses are from internal to external, use [Transaction.expense] ctor,
/// - Revenues are from external to internal, use [Transaction.revenue] ctor.
class Transaction with Jsonizable {

  // MANDATORY ATTRIBUTES
  final DateTime _date;
  final Money _amount;
  final Account _fromAccount;
  final Account _toAccount;

  // OPTIONAL ATTRIBUTES
  Category category;
  Project project;

  /// General constructor, normally not to be used...
  Transaction(
    this._date, this._amount, this._fromAccount, this._toAccount,
    {this.category = UNKNOWN_CATEGORY, this.project = UNKNOWN_PROJECT}
  );

  /// For transfers. No Category, no project.
  Transaction.transfer(
    this._date, this._amount, this._fromAccount, this._toAccount) :
    this.category = UNKNOWN_CATEGORY, this.project = UNKNOWN_PROJECT;

  /// For expenses.
  Transaction.expense(
      this._date, this._amount, this._fromAccount,
      {this.category = UNKNOWN_CATEGORY, this.project = UNKNOWN_PROJECT}) :
      this._toAccount = EXTERNAL_ACCOUNT;

  /// For revenues.
  Transaction.revenue(
      this._date, this._amount, this._toAccount,
      {this.category = UNKNOWN_CATEGORY, this.project = UNKNOWN_PROJECT}) :
        this._fromAccount = EXTERNAL_ACCOUNT;

  factory Transaction.fromMap(Map<String, dynamic> data) {
    // pre format:
    RegExp amountRE = RegExp("(\\d+\\.\\d+)\\s(\\w+)");
    Match amountM = amountRE.firstMatch(data['amount']);

    return Transaction(
      DateTime.parse(data['date']),
      Money.fromString(amountM[1], Currency(amountM[2])),
      Account(data['fromAccount']),
      Account(data['toAccount']),
      category: Category(data['category']['main'], data['category']['sub']),
      project: Project(data['project'])
    );
  }

  factory Transaction.fromJson(String jsonString) {
    return Transaction.fromMap(json.decode(jsonString));
  }

  TRANSACTION_TYPE get type {
    if (this._toAccount == EXTERNAL_ACCOUNT) return TRANSACTION_TYPE.EXPENSE;
    if (this._fromAccount == EXTERNAL_ACCOUNT) return TRANSACTION_TYPE.REVENUE;
    return TRANSACTION_TYPE.TRANSFER;
  }

  DateTime get date => _date;
  Money get amount => _amount;
  Account get fromAccount => _fromAccount;
  Account get toAccount => _toAccount;

  Map<String, dynamic> toMap() {
    return {
      'date': date.toIso8601String(),
      'amount': amount.toString(),
      'fromAccount': fromAccount.alias,
      'toAccount': toAccount.alias,
      'category': category.toMap(),
      'project': project.name
    };
  }
}
