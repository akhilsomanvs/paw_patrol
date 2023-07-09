import 'package:equatable/equatable.dart';

class PetModel extends Equatable {
  PetModel({
    required this.id,
    required this.name,
    required this.age,
    required this.price,
    required this.character,
    required this.species,
    required this.imageURL,
    this.isAdopted = false,
    required this.sex,
    required this.color,
  });

  late final int id;
  late final String name;
  late final int age;
  late final int price;
  late final String character;
  late final String species;
  late final String imageURL;
  late bool isAdopted;
  late final String sex;
  late final String color;

  @override
  List<Object?> get props => [id, name, age, price, character, species, imageURL, isAdopted, sex, color];
}
