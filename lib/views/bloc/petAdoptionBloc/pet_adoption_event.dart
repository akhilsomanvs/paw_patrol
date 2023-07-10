part of 'pet_adoption_bloc.dart';

@immutable
abstract class PetAdoptionEvent {}

class AdoptPetEvent extends PetAdoptionEvent {
  final PetModel petModel;
  final String tag;

  AdoptPetEvent(this.petModel, {this.tag = ""});
}

class ClearAdoptionListEvent extends PetAdoptionEvent {}

class GetAdoptionListEvent extends PetAdoptionEvent {}

class CheckAdoptionEvent extends PetAdoptionEvent {
  final int petId;

  CheckAdoptionEvent(this.petId);
}
