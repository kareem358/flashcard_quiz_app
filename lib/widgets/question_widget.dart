import 'package:flutter/material.dart';
import '../constants.dart';

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      child: Text(
        'Question ${indexAction + 1}/$totalQuestions: $question',
        style: const TextStyle(
          fontSize: 24,
          color: neutral,
        ),
      ),
    );
  }
}