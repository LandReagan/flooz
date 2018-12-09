import 'Amount.dart';
import 'Currency.dart';


class Account {

  String id; // from database
  String name;
  Amount initialAmount;

  Account(this.id, {String name, Amount initialAmount}) {
    this.name = name ?? 'NO_NAME';
    this.initialAmount = initialAmount ?? Amount.defaulted();
  }

  Account.outside(String currencyCode) {
    id = null;
    name = 'Outside';
    initialAmount = Amount(0.0, Currency.fromCode(currencyCode));
  }

  Currency get currency => initialAmount.currency;
}
