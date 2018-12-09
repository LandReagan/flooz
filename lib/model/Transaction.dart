import 'Amount.dart';
import 'Account.dart';


class Transaction {

  // MANDATORY ATTRIBUTES
  String id; // from database
  DateTime date;
  Amount amount;
  Account fromAccount;
  Account toAccount;

}