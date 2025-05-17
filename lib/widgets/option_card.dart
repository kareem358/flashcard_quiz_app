import 'package:flutter/material.dart';
import '../constants.dart';

class OptionCard extends StatelessWidget {
  const OptionCard({super.key,
    required this.option,
   required this.color,

  });

  final String option;
  //final bool isClicked ;
  final Color color;
 // final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Card(  // removing the gesture widget from the card.
      color: color,
      child: ListTile(
        title: Text(
          option,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 22.0,
          ),
        ),
      ),
    );
  }
}
