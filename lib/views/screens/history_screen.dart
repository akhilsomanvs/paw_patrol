import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:paw_patrol/views/bloc/petAdoptionBloc/pet_adoption_bloc.dart';
import 'package:paw_patrol/views/widgets/pet_card_widget.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('History'),
      ),
      body: SafeArea(
        child: BlocBuilder<PetAdoptionBloc, PetAdoptionState>(
          builder: (context, petAdoptionBlocState) {
            if (petAdoptionBlocState is PetAdoptionListLoadedState) {
              final list = petAdoptionBlocState.list;
              return ListView.builder(
                padding: const EdgeInsets.all(16),
                itemCount: list.length,
                itemBuilder: (context, index) {
                  var petModel = list[index];
                  return PetCardWidget(
                    petModel: petModel,
                    onCardTap: (model) {},
                    onAdoptTap: (model) {
                      context.read<PetAdoptionBloc>().add(AdoptPetEvent(petModel));
                    },
                    isAdopted: context.read<PetAdoptionBloc>().isAdopted(petModel),
                  );
                },
              );
            } else {
              return Container();
            }
          },
        ),
      ),
    );
  }
}
