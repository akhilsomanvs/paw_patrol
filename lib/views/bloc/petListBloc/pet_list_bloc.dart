import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';
import 'package:paw_patrol/domain/models/pet_model.dart';
import 'package:paw_patrol/domain/repositories/pet_repository.dart';

import '../../../core/constants/data_constants.dart';

part 'pet_list_event.dart';

part 'pet_list_state.dart';

class PetListBloc extends Bloc<PetListEvent, PetListState> {
  final PetRepository _petRepository;
  final List<PetModel> _petList = [];
  final List<PetModel> _currentPetListByCategory = [];
  final List<PetModel> _recommendedPetList = [];
  PetCategory currentSelected = PetCategory.All;

  int currentPage = 0;

  PetListBloc(this._petRepository) : super(PetListInitialState()) {
    on<PetListInitialEvent>((event, emit) async {
      currentSelected = PetCategory.All;
      emit(PetListLoading());
      final result = await _petRepository.getAllPets();
      result.fold(
        (left) {
          emit(PetListError());
        },
        (petList) {
          _petList.addAll(petList);
          _setCurrentList(_petList);
          _emitLoadedState(emit, _petList);
        },
      );
    });

    on<PetListCategoryEvent>((event, emit) async {
      PetCategory petCategory = event.petCategory;
      currentSelected = petCategory;
      final list = _getListByCategory(currentSelected);
      _setCurrentList(list);
      _emitLoadedState(emit, list);
    });

    on<PetListSearchEvent>((event, emit) async {
      String query = event.query;
      final list = _currentPetListByCategory.where((element) {
        return element.name.toLowerCase().contains(query.toLowerCase());
      }).toList();
      _emitLoadedState(emit, list);
    });

    on<PetListNextPageEvent>((event, emit) async {
      final result = await _petRepository.getNextPageList(++currentPage);
      result.fold(
        (error) {
          emit(PetListError());
        },
        (list) {
          // _petList.addAll(list);
          // _emitLoadedState(emit, _petList);
        },
      );
    });
  }

  int getCountByCategory(PetCategory category) {
    if (category == PetCategory.All) {
      return _petList.length;
    } else if (category == PetCategory.Recommended) {
      return _getRecommendedList().length;
    } else {
      return _petList.where((element) {
        return element.species.toLowerCase() == category.name.toLowerCase();
      }).length;
    }
  }

  List<PetModel> _getRecommendedList() {
    if (_recommendedPetList.isEmpty) {
      final length = _petList.length;
      final endIndex = length > 10 ? 10 : length;
      _recommendedPetList.addAll(_petList.getRange(0, endIndex));
      return _recommendedPetList;
    } else {
      return _recommendedPetList;
    }
  }

  bool isCurrentlySelected(PetCategory petCategory) {
    return currentSelected == petCategory;
  }

  _setCurrentList(List<PetModel> list) {
    _currentPetListByCategory.clear();
    _currentPetListByCategory.addAll(list);
  }

  _emitLoadedState(Emitter<PetListState> emit, List<PetModel> list) {
    emit(PetListLoaded(list));
  }

  List<PetModel> _getListByCategory(PetCategory petCategory) {
    List<PetModel> list = [];
    if (petCategory == PetCategory.All) {
      list = _petList;
    } else if (petCategory == PetCategory.Recommended) {
      final recommendedList = _getRecommendedList();
      list = recommendedList.toList();
    } else {
      list = _petList.where((element) => element.species.toLowerCase() == petCategory.name.toLowerCase()).toList();
    }
    return list;
  }
}
