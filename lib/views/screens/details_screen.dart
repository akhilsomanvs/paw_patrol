import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:paw_patrol/views/bloc/petAdoptionBloc/pet_adoption_bloc.dart';
import 'package:paw_patrol/views/screens/image_screen.dart';
import 'package:paw_patrol/views/widgets/adotped_badge_widget.dart';
import 'package:paw_patrol/views/widgets/dialogs/custom_dialog_widget.dart';

import '../../domain/models/pet_model.dart';

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({required this.petModel, super.key});

  final PetModel petModel;

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  late final ConfettiController _confettiController;

  @override
  void initState() {
    _confettiController = ConfettiController(duration: const Duration(seconds: 4));
    super.initState();
  }

  @override
  void dispose() {
    _confettiController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final ColorScheme colorScheme = theme.colorScheme;
    final MediaQueryData mediaQuery = MediaQuery.of(context);
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          EdgeInsets contentPadding = EdgeInsets.symmetric(horizontal: mediaQuery.size.width * 0.07, vertical: 16);
          return Stack(
            children: [
              Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    child: Hero(
                      tag: widget.petModel.id,
                      child: GestureDetector(
                        behavior: HitTestBehavior.opaque,
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) {
                                return ImageScreen(imageUrl: widget.petModel.imageURL, heroTag: widget.petModel.id);
                              },
                            ),
                          );
                        },
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
                            child: ColorFiltered(
                              colorFilter: ColorFilter.mode(
                                widget.petModel.isAdopted ? Colors.grey : Colors.transparent,
                                BlendMode.saturation,
                              ),
                              child: Image.network(
                                widget.petModel.imageURL,
                                fit: BoxFit.cover,
                                width: double.infinity,
                                height: double.infinity,
                              ),
                            ),
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
              SafeArea(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: CircleAvatar(
                    backgroundColor: colorScheme.surface,
                    child: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(
                        Icons.arrow_back_ios_new_rounded,
                        color: colorScheme.primary,
                      ),
                    ),
                  ),
                ),
              ),

              ///region Pet details
              IgnorePointer(
                child: Padding(
                  padding: contentPadding,
                  child: SingleChildScrollView(
                    child: Stack(
                      children: [
                        Column(
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
                                    widget.petModel.name,
                                    style: theme.textTheme.headlineLarge!.copyWith(color: colorScheme.primary, fontWeight: FontWeight.w600),
                                  ),
                                  const SizedBox(height: 16),
                                  Text(
                                    widget.petModel.character,
                                    style: theme.textTheme.bodySmall!.copyWith(color: colorScheme.primary),
                                  ),
                                  const SizedBox(height: 32),
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      TitleValueWidget(title: "Price", value: widget.petModel.price.toString()),
                                      TitleValueWidget(title: "Age", value: widget.petModel.age.toString()),
                                      TitleValueWidget(title: "Sex", value: widget.petModel.sex.toString()),
                                      TitleValueWidget(title: "Color", value: widget.petModel.color.toString(), cardColor: colorScheme.primary, textColor: colorScheme.background),
                                    ],
                                  ),
                                  const SizedBox(height: 16),
                                  Container(height: 1, width: double.infinity, color: colorScheme.primary.withOpacity(0.3)),
                                  const SizedBox(height: 16),
                                ],
                              ),
                            ),
                            const SizedBox(height: 8),
                          ],
                        ),
                        widget.petModel.isAdopted
                            ? const Positioned.fill(
                                child: Center(
                                  child: AdoptedBadgeWidget(),
                                ),
                              )
                            : const SizedBox.shrink(),
                      ],
                    ),
                  ),
                ),
              ),

              ///endregion
              Positioned.fill(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: contentPadding,
                    child: BlocListener<PetAdoptionBloc, PetAdoptionState>(
                      listener: (context, state) {
                        if (state is PetAdoptedState) {
                          _confettiController.play();
                          showDialog(
                            context: context,
                            builder: (context) => CustomDialogBox(
                              title: 'Success',
                              descriptions: "You've now adopted ${widget.petModel.name}",
                              onOkTap: () {
                                Navigator.pop(context);
                              },
                            ),
                          );
                        } else if (state is PetAdoptionLoadingState) {}
                      },
                      child: SizedBox(
                        width: double.infinity,
                        height: 58,
                        child: FilledButton(
                          onPressed: () {
                            if (!widget.petModel.isAdopted) {
                              BlocProvider.of<PetAdoptionBloc>(context).add(AdoptPetEvent(widget.petModel));
                            }
                          },
                          style: FilledButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: Text(
                            widget.petModel.isAdopted ? "Already Adopted" : "Adopt Me",
                            style: theme.textTheme.bodyLarge!.copyWith(color: colorScheme.background),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Positioned.fill(
                child: Align(
                  alignment: Alignment.topCenter,
                  child: ConfettiWidget(
                    confettiController: _confettiController,
                    blastDirectionality: BlastDirectionality.explosive,
                    numberOfParticles: 40,
                    maxBlastForce: 40,
                    shouldLoop: false,
                    colors: const [Colors.green, Colors.blue, Colors.pink, Colors.orange, Colors.purple],
                  ),
                ),
              ),
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
