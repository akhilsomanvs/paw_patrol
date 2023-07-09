import 'package:dartz/dartz.dart';
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
      }else{
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
}
