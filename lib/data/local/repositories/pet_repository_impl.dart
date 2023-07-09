import 'package:dartz/dartz.dart';
import 'package:paw_patrol/data/local/entities/pet_entity.dart';
import '../../../core/constants/data_constants.dart';

import '../../../core/errors/failures.dart';
import '../../../domain/models/pet_model.dart';
import '../../../domain/repositories/pet_repository.dart';
import '../dao/pet_dao.dart';

class PetRepositoryImpl implements PetRepository {
  late final PetDao _petDao;

  PetRepositoryImpl(this._petDao);

  @override
  Future<Either<Failure, List<PetModel>>> getAllAdoptedPets() async {
    try {
      final allPets = await _petDao.getAllPet();
      if (allPets != null) {
        return Right(allPets);
      } else {
        return const Right([]);
      }
    } catch (e) {
      return Left(CacheFailure());
    }
  }

  @override
  Future<Either<Failure, List<PetModel>>> getAllPets() async {
    List<PetModel> list = DataConstants.mockPetsData;
    return Right(list);
  }

  @override
  Future<int> adoptPet(PetModel petModel) async {
    PetEntity petEntity = PetEntity(
        id: petModel.id,
        name: petModel.name,
        age: petModel.age,
        price: petModel.price,
        character: petModel.character,
        species: petModel.species,
        imageURL: petModel.imageURL,
        sex: petModel.sex,
        color: petModel.color,
        isAdopted: petModel.isAdopted ? 1 : 0);
    return await _petDao.addNewPet(petEntity);
  }
}
