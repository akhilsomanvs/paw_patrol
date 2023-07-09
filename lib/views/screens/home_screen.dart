import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:paw_patrol/core/constants/data_constants.dart';
import 'package:paw_patrol/domain/models/pet_model.dart';
import 'package:paw_patrol/views/bloc/petListBloc/pet_list_bloc.dart';
import 'package:paw_patrol/views/screens/details_screen.dart';
import 'package:paw_patrol/views/widgets/custom_app_bar.dart';
import 'package:paw_patrol/views/widgets/pet_card_widget.dart';
import 'package:paw_patrol/views/widgets/pet_category_widget.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ScrollController _scrollController = ScrollController();

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
      body: SafeArea(
        child: SizedBox(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Search",
                  style: theme.textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.w500),
                ),
                const SizedBox(height: 8),
                const Card(
                  child: TextField(
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(horizontal: 8),
                      border: InputBorder.none,
                    ),
                  ),
                ),
                const SizedBox(height: 8),
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
                          onTap: (){
                            BlocProvider.of<PetListBloc>(context).add(PetListCategoryEvent(item));
                          },
                          child: PetCategoryWidget(
                            title: item.name,
                            imagePath: DataConstants.getCategoryIcon(item),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 8),
                Expanded(
                  flex: 1,
                  child: BlocBuilder<PetListBloc, PetListState>(
                    builder: (context, state) {
                      if (state is PetListLoaded) {
                        final list = state.modelList;
                        return ListView.builder(
                          itemCount: list.length,
                          itemBuilder: (context, index) {
                            var petModel = list[index];
                            return PetCardWidget(
                              petModel: petModel,
                              onCardTap: (model) {
                                _navigateToDetails(context, model);
                              },
                              onAdoptTap: (model) {},
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
            ),
          ),
        ),
      ),
    );
  }

  void pagination() {
    /*if ((_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) && (_subCategoryModel.products.length < total)) {
      setState(() {
        isLoading = true;
        page += 1;
        //add api for load the more data according to new page
      });
    }*/
  }

  void _navigateToDetails(BuildContext context, PetModel petModel) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => DetailsScreen(petModel: petModel),
    ));
  }
}
