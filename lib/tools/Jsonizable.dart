import 'dart:convert' show json;

mixin Jsonizable {

  Map<String, dynamic> toMap();

  String toJson() {
    return json.encode(this.toMap());
  }
}
