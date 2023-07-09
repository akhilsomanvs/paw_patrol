import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:paw_patrol/domain/models/pet_model.dart';
import 'package:paw_patrol/domain/repositories/pet_repository.dart';

part 'pet_adoption_event.dart';
part 'pet_adoption_state.dart';

class PetAdoptionBloc extends Bloc<PetAdoptionEvent, PetAdoptionState> {

  final PetRepository _petRepository;

  PetAdoptionBloc(this._petRepository) : super(PetAdoptionInitial()) {
    on<PetAdoptionEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
