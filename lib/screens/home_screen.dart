import 'package:flutter/material.dart';
import '../constants.dart';
// creat the HomeScreen widget

//stateful widget because it is the  parent widget and all the variable and function will be
// in this  widget which can change the state of our widget anytime
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    // change the background colot
    return Scaffold(
      backgroundColor:Colors.lightBlue,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('Quiz App'),
      ),
    );
  }
}// import this file to main.dart file
