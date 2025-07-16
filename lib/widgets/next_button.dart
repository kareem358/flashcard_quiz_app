/*
import 'package:flutter/material.dart';
import 'package:flashcard_appp/constants.dart';

class NextButton extends StatelessWidget {
  const NextButton({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // Add your navigation or logic here
      },
      borderRadius: BorderRadius.circular(12.0),
      child: Container(
       // width: double.infinity,
        width: 350,
        height: 60,
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blueAccent, background],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(12.0),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.15),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: const Center(
          child: Text(
            'Next Question',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18.0,
              fontWeight: FontWeight.w600,
              letterSpacing: 1.0,
            ),
          ),
        ),
      ),
    );
  }
}
*/


import 'package:flutter/material.dart';
import 'package:flashcard_appp/constants.dart';


class NextButton extends StatelessWidget {
  const NextButton({super.key, });


  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration:BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.blueAccent, background],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(12.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.15),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ), /*BoxDecoration(
        color: neutral,
        borderRadius: BorderRadius.circular(10.0)
      ),
*/
      padding: const EdgeInsets.symmetric(vertical: 14.0),
      child: const Text(
        'Next Question',
        textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            fontSize: 18.0,
            fontWeight: FontWeight.w600,
            letterSpacing: 1.0,
          ),

      ),
    );
  }
}
