import '../entities/pet_entity.dart';
import '../db_manager.dart';

abstract class PetDao {
  Future<List<PetEntity>>? getAllPet();

  Future<int> addNewPet(PetEntity petEntity);
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
  Future<List<PetEntity>> getAllPet() async {
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

  Future<PetEntity?> getPetByID(int id) async {
    List<Map<String, dynamic>> items = await _dbManager.getByID(_petEntityInstance.tableName, id);
    if (items.isNotEmpty) {
      return _getPetModelFromMap(items.first);
    }
    return null;
  }
//endregion
}
