import 'Currency.dart';


class Amount {

  double value;
  Currency currency;
  
  Amount(this.value, this.currency) {
    assert (value >= 0.0);
  }
  
  Amount.fromString(String string) {
    RegExp amountRegExp = RegExp(r'(\d*(?:\.\d+)?)\s+(\w{3})');
    Match match = amountRegExp.firstMatch(string);
    
    // TODO replace the AssertionError with owned exception when implemented.
    if (match == null) throw AssertionError;
    
    this.value = double.parse(match[1]);
    this.currency = Currency.fromCode(match[2]);
  }

  Amount.defaulted() {
    value = 0.0;
    currency = Currency.fromCode('USD');
  }
  
  @override
  String toString() {
    int precision = currency.precision;
    String returnString = value.toString();

    // Case of no decimal
    if (!returnString.contains(r'.')) returnString += '.';

    // Add zeros to match precision
    // 23.50
    while (returnString.indexOf('.') > returnString.length - precision - 1) {
      returnString += '0';
    }

    returnString += ' ' + currency.code;
    return returnString;
  }

}
