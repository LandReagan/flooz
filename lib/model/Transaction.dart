import 'package:money/money.dart';
import 'package:flooz/model/Account.dart' show Account;
import 'package:flooz/model/Category.dart' show Category;
import 'package:flooz/model/Project.dart' show Project;


class Transaction {

  // MANDATORY ATTRIBUTES
  String _id; // from database
  DateTime _date;
  Money _amount;
  Account _fromAccount;
  Account _toAccount;

  // OPTIONAL ATTRIBUTES
  Category _category;
  Project _project;

}
