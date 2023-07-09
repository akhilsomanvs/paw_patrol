part of 'pet_list_bloc.dart';

@immutable
abstract class PetListState {}

class PetListInitialState extends PetListState {}

class PetListLoading extends PetListState {}

class PetListLoaded extends PetListState {
  final List<PetModel> modelList;

  PetListLoaded(this.modelList);
}

class PetListEmpty extends PetListState {}
class PetListError extends PetListState {}
