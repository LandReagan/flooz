class Currency {

  String code;
  int precision;

  Currency(this.code, this.precision){
    assert(code.length == 3);
    assert(precision == 2 || precision == 3);
  }

  Currency.fromCode(String code){
    if (precisions.containsKey(code)) {
      this.code = code;
      this.precision = precisions[code];
    }
  }

  // TODO: get an API for that
  static Map<String, int> precisions = {
    'EUR': 2,
    'OMR': 3,
    'USD': 2,
  };
}
