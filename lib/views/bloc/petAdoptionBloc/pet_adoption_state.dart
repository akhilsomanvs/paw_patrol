part of 'pet_adoption_bloc.dart';

@immutable
abstract class PetAdoptionState {}

class PetAdoptionInitialState extends PetAdoptionState {}

class PetAdoptionLoadingState extends PetAdoptionState {}

class PetAdoptionErrorState extends PetAdoptionState {}

class PetAdoptedState extends PetAdoptionState {}

class PetAdoptionListLoadingState extends PetAdoptionState {}

class PetAdoptionListLoadedState extends PetAdoptionState {
  final List<PetModel> list;

  PetAdoptionListLoadedState(this.list);
}
