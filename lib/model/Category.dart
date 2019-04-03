const Map<String, List<String>> DefaultCategories = {
  "House": ["Loan", "Rent", "Electricity", "Water"],
  "Car": ["Loan", "Rent", "Fuel", "Cleaning", "Parking", ],
  "Job": ["Salary", "Professional Expenses"],
  // todo: continue the defaulted list from examples
};

class Category {

  String _main;
  String _sub;

  // todo: get it updated by the database / user profile
  static Map<String, List<String>> categories = DefaultCategories;

  Category(String main, String sub) {
    if (categories.containsKey(main)) {
      _main = main;
      if (categories[_main].contains(sub)) {
        _sub = sub;
      } else {
        _sub = "Unknown";
      }
    } else {
      _main = "Unknown";
      _sub = "Unknown";
    }
  }

  String get main => _main;
  String get sub => _sub;
}
