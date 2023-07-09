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

  PetListBloc(this._petRepository) : super(PetListInitialState()) {
    on<PetListInitialEvent>((event, emit) async {
      emit(PetListLoading());
      final result = await _petRepository.getAllPets();
      result.fold(
        (left) {
          emit(PetListError());
        },
        (petList) {
          _petList.addAll(petList);
          emit(PetListLoaded(_petList));
        },
      );
    });

    on<PetListCategoryEvent>((event, emit) async {
      PetCategory petCategory = event.petCategory;
      if (petCategory == PetCategory.All) {
        emit(PetListLoaded(_petList));
      } else if (petCategory == PetCategory.Recommended) {
        final length = _petList.length;
        final endIndex = length > 10 ? 10 : length;
        final recommendedList = _petList.getRange(0, endIndex);
        emit(PetListLoaded(recommendedList.toList()));
      } else {
        final list = _petList.where((element) => element.species.toLowerCase() == petCategory.name.toLowerCase()).toList();
        emit(PetListLoaded(list));
      }
    });
  }
}
