part of 'pet_list_bloc.dart';

@immutable
abstract class PetListEvent {}

class PetListInitialEvent extends PetListEvent {}

class PetListCategoryEvent extends PetListEvent {
  final PetCategory petCategory;

  PetListCategoryEvent(this.petCategory);
}

class PetListSearchEvent extends PetListEvent {
  final String query;

  PetListSearchEvent(this.query);
}
