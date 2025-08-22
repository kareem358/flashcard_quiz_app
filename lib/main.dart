import 'package:flutter/material.dart';

import './screens/home_screen.dart';


void main ()
{

  runApp(
    const MyApp(),// creating MyApp below
  );
}



  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),// creating  this in a separate folder for different screen
    );
  }
}
