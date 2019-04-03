import 'package:test/test.dart';

import 'package:flooz/model/Category.dart';


void main() {
  test("Category constructor with wrong values", () {
    Category test1 = Category("ACategoryThatDoesntExist", "ASubCategoryThatDoesntExistEither");
    expect(test1.main, "Unknown");
    expect(test1.sub, "Unknown");
  });

  test("Category constructor", (){
    Category test2 = Category("House", "Electricity");
    expect(test2.main, "House");
    expect(test2.sub, "Electricity");
  });
}
