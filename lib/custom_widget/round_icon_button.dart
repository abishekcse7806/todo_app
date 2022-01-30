import 'package:flutter/material.dart';
import 'package:todo_app/constants/colors.dart';

class RoundIconButton extends StatelessWidget {
  const RoundIconButton({required this.icon, required this.onPressed});

  final IconData icon;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
        child: Icon(icon),
        onPressed: () {
          onPressed();
        },
        elevation: 0.0,
        constraints: const BoxConstraints.tightFor(
          width: 50.0,
          height: 50.0,
        ),
        shape: const CircleBorder(),
        fillColor: kprimaryColor);
  }
}
