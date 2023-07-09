import 'package:paw_patrol/data/local/base/base_db_entity.dart';

import '../../../domain/models/pet_model.dart';

///
///Table to store the details of the adopted pets
///
class PetEntity extends PetModel implements BaseDBEntity {
  //region table columns
  static const String _colName = 'name';
  static const String _colAge = 'age';
  static const String _colPrice = 'price';
  static const String _colCharacter = 'character';
  static const String _colSpecies = 'species';
  static const String _colImageURL = 'imageURL';
  static const String _colIsAdopted = 'isAdopted';
  static const String _colSex = 'sex';
  static const String _colColor = 'color';

//endregion

  PetEntity({
    required int id,
    required String name,
    required int age,
    required int price,
    required String character,
    required String species,
    required String imageURL,
    required String sex,
    required String color,
    int isAdopted = 0,
  }) : super(
          id: id,
          age: age,
          name: name,
          character: character,
          imageURL: imageURL,
          price: price,
          species: species,
          isAdopted: isAdopted == 1,
          sex: sex,
          color: color,
        );

  //region Custom Constructors
  static PetEntity? _instance;

  static PetEntity staticObject() {
    return (_instance ??= PetEntity(id: -1, age: 0, species: "", price: 0, imageURL: "", character: "", name: "", isAdopted: 0, sex: 'male', color: 'white'));
  }

  //endregion

  //region Local DB methods

  @override
  int getId() => id;

  @override
  List<DBColumnModel> get listOfColumns => [
        DBColumnModel(BaseDBEntity.colId, "INTEGER PRIMARY KEY"),
        DBColumnModel(_colName, "TEXT"),
        DBColumnModel(_colAge, "INTEGER"),
        DBColumnModel(_colPrice, "INTEGER"),
        DBColumnModel(_colCharacter, "TEXT"),
        DBColumnModel(_colSpecies, "TEXT"),
        DBColumnModel(_colImageURL, "TEXT"),
        DBColumnModel(_colIsAdopted, "INTEGER"),
        DBColumnModel(_colSex, "TEXT"),
        DBColumnModel(_colColor, "TEXT"),
      ];

  @override
  String get tableName => "Pet";

  @override
  Map<String, dynamic> toJsonForDB() {
    return {
      BaseDBEntity.colId: id,
      _colName: name,
      _colAge: age,
      _colPrice: price,
      _colCharacter: character,
      _colSpecies: species,
      _colImageURL: imageURL,
      _colIsAdopted: isAdopted,
      _colSex: sex,
      _colColor: color,
    };
  }

  //endregion

  //region Conversion methods
  factory PetEntity.fromJson(Map<String, dynamic> json) {
    return PetEntity(
      id: json[BaseDBEntity.colId],
      name: json[_colName],
      age: json[_colAge],
      price: json[_colPrice],
      character: json[_colCharacter],
      species: json[_colSpecies],
      imageURL: json[_colImageURL],
      isAdopted: json[_colIsAdopted] ?? 0,
      sex: json[_colSex],
      color: json[_colColor],
    );
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name'] = name;
    _data['age'] = age;
    _data['price'] = price;
    _data['character'] = character;
    _data['species'] = species;
    _data['imageURL'] = imageURL;
    return _data;
  }
//endregion
}
