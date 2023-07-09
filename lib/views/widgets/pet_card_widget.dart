import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:paw_patrol/core/constants/data_constants.dart';
import 'package:paw_patrol/views/widgets/adotped_badge_widget.dart';
import '../../domain/models/pet_model.dart';

class PetCardWidget extends StatelessWidget {
  const PetCardWidget({
    required this.petModel,
    this.onCardTap,
    this.onAdoptTap,
    super.key,
    this.isAdopted = false,
  });

  final PetModel petModel;
  final bool isAdopted;
  final Function(PetModel)? onCardTap;
  final Function(PetModel)? onAdoptTap;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final ColorScheme colorScheme = theme.colorScheme;
    return GestureDetector(
      onTap: () {
        onCardTap?.call(petModel);
      },
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Stack(
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 120,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: Colors.white),
                    child: Hero(
                      tag: petModel.id,
                      child: AspectRatio(
                        aspectRatio: 1,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: ColorFiltered(
                            colorFilter: ColorFilter.mode(
                              isAdopted ? Colors.grey : Colors.transparent,
                              BlendMode.saturation,
                            ),
                            child: Image.network(
                              petModel.imageURL,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: Text(
                                petModel.name,
                                style: theme.textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.bold),
                              ),
                            ),
                            SvgPicture.asset(
                              DataConstants.getCategoryIconPath(petModel.species),
                              colorFilter: ColorFilter.mode(colorScheme.primary, BlendMode.srcIn),
                              height: 24,
                              width: 24,
                            ),
                            const SizedBox(width: 8),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Text(petModel.character, style: theme.textTheme.bodySmall, maxLines: 2, overflow: TextOverflow.ellipsis),
                        const SizedBox(height: 8),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                "${petModel.price.toString()}\$",
                                style: theme.textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.bold, color: colorScheme.secondary),
                              ),
                              const Expanded(child: SizedBox()),
                              Opacity(
                                opacity: isAdopted ? 0 : 1,
                                child: FilledButton(
                                  onPressed: () {
                                    onAdoptTap?.call(petModel);
                                  },
                                  style: FilledButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                  child: Text("Adopt"),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              isAdopted
                  ? const Positioned.fill(
                      child: Center(
                        child: AdoptedBadgeWidget(),
                      ),
                    )
                  : const SizedBox.shrink()
            ],
          ),
        ),
      ),
    );
  }
}
