import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:paw_patrol/data/local/dao/pet_dao.dart';
import 'package:paw_patrol/data/local/db_manager.dart';
import 'package:paw_patrol/data/local/entities/pet_entity.dart';
import 'package:paw_patrol/data/local/repositories/pet_repository_impl.dart';
import 'package:paw_patrol/domain/models/pet_model.dart';
import 'package:paw_patrol/domain/repositories/pet_repository.dart';

class MockPetDao extends Mock implements PetDao {}

void main() {
  late MockPetDao mockPetDao;
  late PetRepository petRepository;

  final List<PetEntity> _petList = [
    PetEntity.fromJson(const {
      "id": 1,
      "name": "Fluffy",
      "age": 2,
      "price": 100,
      "character": "Fluffy is a playful and energetic dog. She loves chasing balls and going for long walks in the park.",
      "species": "dog",
      "imageURL": "https://example.com/fluffy.jpg"
    }),
    PetEntity.fromJson(const {
      "id": 2,
      "name": "Whiskers",
      "age": 1,
      "price": 50,
      "character": "Whiskers is a curious and friendly cat. He enjoys exploring new places and cuddling up on laps.",
      "species": "cat",
      "imageURL": "https://example.com/whiskers.jpg"
    }),
  ];

  setUp(() {
    mockPetDao = MockPetDao();
    petRepository = PetRepositoryImpl(mockPetDao);
  });

  test("Get list of All adopted pets", () async {
    when(mockPetDao.getAllPet()).thenAnswer((_) async {
      return _petList;
    });
    final result = await petRepository.getAllAdoptedPets();
    verify(mockPetDao.getAllPet());
    expect(result, equals(Right(_petList as List<PetModel>)));
  });
}
