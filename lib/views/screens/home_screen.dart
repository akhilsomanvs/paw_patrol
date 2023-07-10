import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:paw_patrol/core/constants/data_constants.dart';
import 'package:paw_patrol/domain/models/pet_model.dart';
import 'package:paw_patrol/views/bloc/petAdoptionBloc/pet_adoption_bloc.dart';
import 'package:paw_patrol/views/bloc/petListBloc/pet_list_bloc.dart';
import 'package:paw_patrol/views/screens/details_screen.dart';
import 'package:paw_patrol/views/widgets/custom_app_bar.dart';
import 'package:paw_patrol/views/widgets/dialogs/custom_dialog_widget.dart';
import 'package:paw_patrol/views/widgets/nav_drawer.dart';
import 'package:paw_patrol/views/widgets/pet_card_widget.dart';
import 'package:paw_patrol/views/widgets/pet_category_widget.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ScrollController _scrollController = ScrollController();
  final TextEditingController _searchTextController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final ColorScheme colorScheme = theme.colorScheme;
    final MediaQueryData mediaQuery = MediaQuery.of(context);
    return Scaffold(
      appBar: const CustomAppBar(),
      drawer: const NavDrawer(),
      body: SafeArea(
        child: SizedBox(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4),
            child: SizedBox(
              child: BlocListener<PetAdoptionBloc, PetAdoptionState>(
                listener: (context, state) {
                  if (state is PetAdoptedState) {
                    final petModel = state.petModel;
                    showDialog(
                      context: context,
                      builder: (context) => CustomDialogBox(
                        title: 'Success',
                        descriptions: "You've now adopted ${petModel.name}",
                        onOkTap: () {},
                      ),
                    );
                  } else if (state is PetAdoptionLoadingState) {}
                },
                child: BlocBuilder<PetAdoptionBloc, PetAdoptionState>(
                  builder: (context, petAdoptionState) {
                    return BlocBuilder<PetListBloc, PetListState>(
                      builder: (context, petListBlocState) {
                        return Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Search",
                              style: theme.textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.w500),
                            ),
                            const SizedBox(height: 8),
                            Card(
                              child: TextField(
                                controller: _searchTextController,
                                onChanged: (text) {
                                  BlocProvider.of<PetListBloc>(context).add(PetListSearchEvent(text));
                                },
                                decoration: const InputDecoration(contentPadding: EdgeInsets.symmetric(horizontal: 8), border: InputBorder.none, hintText: "Type here"),
                              ),
                            ),
                            const SizedBox(height: 8),

                            ///
                            /// Category
                            ///
                            SizedBox(
                              height: 140,
                              child: ListView.builder(
                                itemCount: PetCategory.values.length,
                                scrollDirection: Axis.horizontal,
                                padding: EdgeInsets.zero,
                                itemBuilder: (context, index) {
                                  var item = PetCategory.values[index];
                                  return Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: GestureDetector(
                                      onTap: () {
                                        _searchTextController.text = "";
                                        BlocProvider.of<PetListBloc>(context).add(PetListCategoryEvent(item));
                                      },
                                      child: PetCategoryWidget(
                                        title: item.name,
                                        imagePath: DataConstants.getCategoryIcon(item),
                                        count: BlocProvider.of<PetListBloc>(context).getCountByCategory(item),
                                        isSelected: BlocProvider.of<PetListBloc>(context).isCurrentlySelected(item),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                            const SizedBox(height: 8),

                            ///
                            /// Pet List
                            ///
                            Expanded(
                              flex: 1,
                              child: Builder(
                                builder: (context) {
                                  if (petListBlocState is PetListLoaded) {
                                    final list = petListBlocState.modelList;
                                    return ListView.builder(
                                      itemCount: list.length,
                                      shrinkWrap: true,
                                      itemBuilder: (context, index) {
                                        var petModel = list[index];
                                        return PetCardWidget(
                                          key: Key("${petModel.id}"),
                                          petModel: petModel,
                                          onCardTap: (model) {
                                            final isAdopted = context.read<PetAdoptionBloc>().isAdopted(petModel);
                                            model.isAdopted = isAdopted;
                                            _navigateToDetails(context, model);
                                          },
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
                          ],
                        );
                      },
                    );
                  },
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void pagination() {
    if ((_scrollController.position.pixels == _scrollController.position.maxScrollExtent)) {

    }
  }

  void _navigateToDetails(BuildContext context, PetModel petModel) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => DetailsScreen(petModel: petModel),
    ));
  }
}
