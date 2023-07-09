part of 'pet_adoption_bloc.dart';

@immutable
abstract class PetAdoptionState {}

class PetAdoptionInitial extends PetAdoptionState {}

class PetAdoptionListLoading extends PetAdoptionState {}

class PetAdoptionListLoaded extends PetAdoptionState {
  final List<PetModel> list;

  PetAdoptionListLoaded(this.list);
}
