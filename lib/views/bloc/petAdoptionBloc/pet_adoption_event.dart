part of 'pet_adoption_bloc.dart';

@immutable
abstract class PetAdoptionEvent {}

class AdoptPetEvent extends PetAdoptionEvent {
  final PetModel petModel;

  AdoptPetEvent(this.petModel);
}

class ClearAdoptionListEvent extends PetAdoptionEvent {}

class GetAdoptionListEvent extends PetAdoptionEvent {}
