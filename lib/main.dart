import 'package:flutter/material.dart';
import './screens/home_screen.dart';
// run the main method

void main ()
{
  runApp(
    const MyApp(),// creating MyApp below
  );
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});// any one line can be okay
  //const MyApp({Key? key}):super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),// creating  this in a separate folder for different screen
    );
  }
}
