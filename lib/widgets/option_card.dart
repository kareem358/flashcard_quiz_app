import 'package:flutter/material.dart';
import '../constants.dart';

class OptionCard extends StatelessWidget {
  const OptionCard({
    super.key,
    required this.option,
    required this.color,
  });

  final String option;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: color,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      elevation: 4.0, // subtle shadow
      margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 12.0),
     
      ),
    );
  }
}

