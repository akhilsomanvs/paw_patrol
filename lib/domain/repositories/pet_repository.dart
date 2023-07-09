import 'package:dartz/dartz.dart';
import '../../core/errors/failures.dart';
import '../models/pet_model.dart';

abstract class PetRepository {
  Future<Either<Failure, List<PetModel>>> getAllPets();

  Future<Either<Failure, List<PetModel>>> getAllAdoptedPets();
}
