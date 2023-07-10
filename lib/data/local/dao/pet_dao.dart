import 'package:paw_patrol/core/constants/data_constants.dart';

import '../entities/pet_entity.dart';
import '../db_manager.dart';

abstract class PetDao {
  Future<List<PetEntity>>? getAllAdoptedPets();

  Future<List<PetEntity>>? getAllPets();

  Future<List<PetEntity>?>? getNextPage(int page);

  Future<int> addNewPet(PetEntity petEntity);

  Future<PetEntity?> getPetById(int petId);
}

class PetDaoImpl implements PetDao {
  final DBManager _dbManager;

  PetDaoImpl(this._dbManager);

  PetEntity get _petEntityInstance => PetEntity.staticObject();

  _getPetModelFromMap(Map<String, dynamic> json) {
    return PetEntity.fromJson(json);
  }

  //region CRUD
  @override
  Future<int> addNewPet(PetEntity model) async {
    return await _dbManager.insert(model);
  }

  @override
  Future<List<PetEntity>> getAllAdoptedPets() async {
    List<PetEntity> modelList = [];
    List<Map<String, dynamic>> items = await _dbManager.getAllItems(_petEntityInstance.tableName);
    for (var json in items) {
      modelList.add(_getPetModelFromMap(json));
    }
    return modelList;
  }

  Future<int> updatePet(PetEntity model) async {
    return await _dbManager.update(model);
  }

  @override
  Future<PetEntity?> getPetById(int id) async {
    List<Map<String, dynamic>> items = await _dbManager.getByID(_petEntityInstance.tableName, id);
    if (items.isNotEmpty) {
      return _getPetModelFromMap(items.first);
    }
    return null;
  }

  @override
  Future<List<PetEntity>?>? getNextPage(int page) async {
    //This should be fetched from the API
    int perPageCount = 10;
    final list = await getAllPets();
    if (list != null) {
      int startIndex = perPageCount * page;
      int endIndex = (startIndex + perPageCount) - 1;

      if (list.length <= startIndex) {
        return null;
      }
      if (list.length <= endIndex) {
        return null;
      }

      return list.getRange(startIndex, endIndex).toList();
    }
    return null;
  }

  @override
  Future<List<PetEntity>>? getAllPets() async {
    return DataConstants.mockPetsData;
  }
//endregion
}
