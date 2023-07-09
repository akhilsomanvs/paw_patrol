import 'package:flutter/material.dart';

import '../../domain/models/pet_model.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({required this.petModel, super.key});

  final PetModel petModel;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final ColorScheme colorScheme = theme.colorScheme;
    final MediaQueryData mediaQuery = MediaQuery.of(context);
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Stack(
            children: [
              Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    child: Hero(
                      tag: petModel.id,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(40),
                            bottomRight: Radius.circular(40),
                          ),
                          color: colorScheme.secondary,
                        ),
                        child: ClipRRect(
                          borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(40),
                            bottomRight: Radius.circular(40),
                          ),
                          child: Image.network(
                            petModel.imageURL,
                            fit: BoxFit.cover,
                            width: double.infinity,
                            height: double.infinity,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: ColoredBox(
                      color: colorScheme.background,
                    ),
                  ),
                ],
              ),

              ///region Pet details
              Padding(
                padding: EdgeInsets.symmetric(horizontal: mediaQuery.size.width * 0.07),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(height: mediaQuery.size.height * 0.42),
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                        decoration: BoxDecoration(
                          color: colorScheme.background,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              petModel.name,
                              style: theme.textTheme.headlineLarge!.copyWith(color: colorScheme.primary, fontWeight: FontWeight.w600),
                            ),
                            const SizedBox(height: 16),
                            Text(
                              petModel.character,
                              style: theme.textTheme.bodySmall!.copyWith(color: colorScheme.primary),
                            ),
                            const SizedBox(height: 32),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                TitleValueWidget(title: "Price", value: petModel.price.toString()),
                                TitleValueWidget(title: "Age", value: petModel.age.toString()),
                                TitleValueWidget(title: "Sex", value: petModel.sex.toString()),
                                TitleValueWidget(title: "Color", value: petModel.color.toString(), cardColor: colorScheme.primary, textColor: colorScheme.background),
                              ],
                            ),
                            const SizedBox(height: 16),
                            Container(height: 1, width: double.infinity, color: colorScheme.primary.withOpacity(0.3)),
                            const SizedBox(height: 16),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              ///endregion
            ],
          );
        },
      ),
    );
  }
}

class TitleValueWidget extends StatelessWidget {
  TitleValueWidget({
    super.key,
    required this.title,
    required this.value,
    this.cardColor,
    this.textColor,
  });

  final String title;
  final String value;
  final Color? cardColor;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final ColorScheme colorScheme = theme.colorScheme;
    Color color = cardColor ?? colorScheme.surface;
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          title,
          style: theme.textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 8),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
          decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(5)),
          child: Text(
            value,
            style: theme.textTheme.bodyMedium!.copyWith(color: textColor ?? colorScheme.primary),
          ),
        ),
      ],
    );
  }
}
