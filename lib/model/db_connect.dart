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


    //fetch the data from database
 Future<List<Question>> fetchQuestion() async{
     // we just got the data using this , now let's print it to see what we got
    return http.get(url).then((response) {
       // the 'then' method returns a 'response' which is our data.
       // what inside will be  decoded first

       var data = json.decode(response.body) as Map<String, dynamic>;
       List<Question> newQuestions =[];
       data.forEach((key, value){
         var newQuestion= Question (
           id: key,// the encrypted key/ the title we give to our data
           title : value ['title'],// title of the question
           options:value['options'] != null
               ? Map.castFrom(value['options'])
               : <String, bool>{},


         );

         // add to new question
         newQuestions.add(newQuestion);

       });
       return newQuestions;
     });
 }
 }