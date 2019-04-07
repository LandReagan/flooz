const UNKNOWN_PROJECT = Project.unknown();

class Project {

  final String _name;

  Project(this._name);

  const Project.unknown() : this._name = "Unknown";

  String get name => _name;
}
