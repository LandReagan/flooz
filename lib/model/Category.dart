const Map<String, List<String>> DefaultCategories = {
  "House": ["Loan", "Rent", "Electricity", "Water"],
  "Car": ["Loan", "Rent", "Fuel", "Cleaning", "Parking", ],
  "Job": ["Salary", "Professional Expenses"],
  // todo: continue the defaulted list from examples
};

const UNKNOWN_CATEGORY = Category.unknown();

class Category {

  final String _main;
  final String _sub;

  // todo: get it updated by the database / user profile
  static Map<String, List<String>> categories = DefaultCategories;

  Category(this._main, this._sub);

  const Category.unknown() : this._main = "Unknown", this._sub = "Unknown";

  String get main => _main;
  String get sub => _sub;

  Map<String, dynamic> toMap() {
    return {
      'main': main,
      'sub': sub
    };
  }
}
