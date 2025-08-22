import 'dart:convert';
import 'package:http/http.dart' as http;
import './question_model.dart';

class DBconnect {
  final url = Uri.parse(
      'https://flashcardquizapp-a138a-default-rtdb.firebaseio.com/question.json');

  Future<List<Question>> fetchQuestion() async {

  }
}