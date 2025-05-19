import 'package:http/http.dart' as http; // the http package
import './question_model.dart';
import 'dart:convert';
 class DBconnect {
   // lets first create a function to add question to the database.
   // here in the brackets we have to add the address of firebase database
   // declare the name of the table and add .json as suffix after the table name in the end of address
   final url = Uri.parse('https://flashcardquizapp-a138a-default-rtdb.firebaseio.com/'
       'question.json');


   Future<void> addQuestion(Question question)async{
     http.post(url, body: json.encode({
       'title': question.title,
       'option': question.options,
     }));
   }

 }