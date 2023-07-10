import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:paw_patrol/domain/models/pet_model.dart';
import 'package:paw_patrol/domain/repositories/pet_repository.dart';

part 'pet_adoption_event.dart';

part 'pet_adoption_state.dart';

class PetAdoptionBloc extends Bloc<PetAdoptionEvent, PetAdoptionState> {
  final PetRepository _petRepository;
  final Map<int, PetModel> _adoptedPetsList = {};

  PetAdoptionBloc(this._petRepository) : super(PetAdoptionInitialState()) {
    on<AdoptPetEvent>((event, emit) async {
      emit(PetAdoptionLoadingState());
      final petModel = event.petModel;
      final tag = event.tag;
      final id = await _petRepository.adoptPet(petModel);
      emit(PetAdoptedState(petModel, tag: tag));
      add(GetAdoptionListEvent());
    });

    on<CheckAdoptionEvent>((event, emit) async {
      emit(PetAdoptionLoadingState());
      final petId = event.petId;
      final result = await _petRepository.getPetById(petId);
      result.fold(
        (error) {
          emit(PetAdoptionErrorState());
        },
        (petModel) {
          emit(PetAlreadyAdoptedState(petModel));
        },
      );
    });

    on<GetAdoptionListEvent>((event, emit) async {
      emit(PetAdoptionLoadingState());
      final result = await _petRepository.getAllAdoptedPets();
      result.fold(
        (l) {
          emit(PetAdoptionErrorState());
        },
        (list) {
          _adoptedPetsList.clear();
          for (var petModel in list) {
            _adoptedPetsList[petModel.id] = petModel;
          }
          emit(PetAdoptionListLoadedState(list));
        },
      );
    });
  }

  bool isAdopted(PetModel petModel) {
    return _adoptedPetsList.keys.contains(petModel.id);
  }
}
