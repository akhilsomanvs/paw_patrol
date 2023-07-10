import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomDialogBox extends StatefulWidget {
  final String title, descriptions;
  final Function()? onOkTap;

  const CustomDialogBox({
    Key? key,
    required this.title,
    required this.descriptions,
    this.onOkTap,
  }) : super(key: key);

  @override
  State<CustomDialogBox> createState() => _CustomDialogBoxState();
}

class _CustomDialogBoxState extends State<CustomDialogBox> {
  final double padding = 20;
  final double avatarRadius = 45;
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
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(padding),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: contentBox(context),
    );
  }

  Widget contentBox(context) {
    final ThemeData theme = Theme.of(context);
    final ColorScheme colorScheme = theme.colorScheme;
    _confettiController.play();
    return Stack(
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(left: padding, top: avatarRadius + padding, right: padding, bottom: padding),
          margin: EdgeInsets.only(top: avatarRadius),
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            color: colorScheme.surface,
            borderRadius: BorderRadius.circular(padding),
            boxShadow: [
              BoxShadow(color: colorScheme.primary.withOpacity(0.5), offset: Offset(0, 10), blurRadius: 10),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                widget.title,
                style: theme.textTheme.bodyMedium!.copyWith(
                  color: colorScheme.primary,
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Text(
                widget.descriptions,
                style: theme.textTheme.bodyMedium!.copyWith(
                  fontSize: 14,
                  color: colorScheme.primary,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 22,
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: OutlinedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    widget.onOkTap?.call();
                  },
                  child: Text(
                    "Ok",
                    style: theme.textTheme.bodyMedium!.copyWith(
                      fontSize: 18,
                      color: colorScheme.primary,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Positioned(
          left: padding,
          right: padding,
          child: CircleAvatar(
            backgroundColor: colorScheme.surface,
            radius: avatarRadius,
            child: ClipRRect(borderRadius: BorderRadius.all(Radius.circular(avatarRadius)), child: SvgPicture.asset("assets/icons/ic_all_pets.svg")),
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
  }
}
