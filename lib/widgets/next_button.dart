import 'package:flashcard_appp/constants.dart';
import 'package:flutter/material.dart';


class NextButton extends StatelessWidget {
  const NextButton({super.key, });


  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: neutral,
        borderRadius: BorderRadius.circular(10.0)
      ),
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: const Text(
        'Next Question',
        textAlign: TextAlign.center,

      ),
    );
  }
}
