import 'package:money/money.dart' show Money;

import 'package:flooz/model/Account.dart';
import 'package:flooz/model/Transaction.dart';


class AccountExtract {

  final Account _account;
  final Money _initialBalance;
  List<_AccountLine> _lines = [];

  AccountExtract(this._account, this._initialBalance);

  void addTransactions(List<Transaction> newTransactions) {
    newTransactions.forEach((transaction) {
      _lines.add(_AccountLine(transaction, Money(0, _initialBalance.currency)));
    });

    _lines.sort((a, b) {
      // todo: check!
      if (a.transaction.date.isBefore(b.transaction.date)) return 1;
      return -1;
    });

    for (int i = 0; i < _lines.length; i++) {
      _AccountLine current = _lines[i];
      _AccountLine previous;
      if (i > 0) previous = _lines[i - 1];

    }
  }
}

class _AccountLine {

  final Transaction transaction;
  final Money balance;

  _AccountLine(this.transaction, this.balance);
}
