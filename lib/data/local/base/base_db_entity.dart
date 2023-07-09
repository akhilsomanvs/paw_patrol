abstract class BaseDBEntity {
  String get tableName;

  static const String colId = "id";

  List<DBColumnModel> get listOfColumns;

  int getId();

  Map<String, dynamic> toJsonForDB();
}

class DBColumnModel {
  final String name;
  final String type;

  DBColumnModel(this.name, this.type);
}
