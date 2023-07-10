import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:paw_patrol/core/constants/data_constants.dart';
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
      "imageURL": "https://images.squarespace-cdn.com/content/v1/5c336783f2e6b11a9d3b5693/1655067695088-ENM7V3W64DVOJ66N5DMC/220327_vretenar1129.jpg?format=750w",
      "sex": "female",
      "color": "white"
    }),
    PetEntity.fromJson(const {
      "id": 2,
      "name": "Whiskers",
      "age": 1,
      "price": 50,
      "character": "Whiskers is a curious and friendly cat. He enjoys exploring new places and cuddling up on laps.",
      "species": "cat",
      "imageURL": "https://www.thisiscolossal.com/wp-content/uploads/2022/07/vogelsang-2.jpg",
      "sex": "male",
      "color": "black"
    })
  ];

  setUp(() {
    mockPetDao = MockPetDao();
    petRepository = PetRepositoryImpl(mockPetDao);
  });

  group("Pet List", () {
    test("Should return a list of PetModel when fetching the list of adopted pets", () async {
      when(mockPetDao.getAllAdoptedPets()).thenAnswer((_) async {
        return _petList;
      });
      final result = await petRepository.getAllAdoptedPets();
      verify(mockPetDao.getAllAdoptedPets());
      expect(result, equals(Right(_petList as List<PetModel>)));
    });
  });
}
