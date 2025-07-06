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
        child: Text(
          option,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 20.0,
            color: color == neutral ? Colors.black : Colors.white,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}

/*import 'package:flutter/material.dart';
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
            fontSize: 23.0,
            // we will decide if the color we are receiving for which
            // ratio of green and red
          //  color: color.red != color.green ? neutral: Colors.black,
            color: color == neutral ? Colors.black : neutral,
          ),
        ),
      ),
    );
  }
}
*/