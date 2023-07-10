part of 'pet_adoption_bloc.dart';

@immutable
abstract class PetAdoptionState {}

class PetAdoptionInitialState extends PetAdoptionState {}

class PetAdoptionLoadingState extends PetAdoptionState {}

class PetAdoptionErrorState extends PetAdoptionState {}

class PetAdoptedState extends PetAdoptionState {
  final PetModel petModel;

  PetAdoptedState(this.petModel);
}

class PetAlreadyAdoptedState extends PetAdoptionState {
  final PetModel petModel;

  PetAlreadyAdoptedState(this.petModel);
}

class PetAdoptionListLoadingState extends PetAdoptionState {}

class PetAdoptionListLoadedState extends PetAdoptionState {
  final List<PetModel> list;

  PetAdoptionListLoadedState(this.list);
}
