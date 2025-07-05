import 'dart:convert';
import 'package:http/http.dart' as http;
import './question_model.dart';

class DBconnect {
  final url = Uri.parse(
      'https://flashcardquizapp-a138a-default-rtdb.firebaseio.com/question.json');

  Future<List<Question>> fetchQuestion() async {
    final resp = await http.get(url);
    final raw = json.decode(resp.body);
    if (raw is! Map) return [];

    final qs = <Question>[];
    raw.forEach((key, value) {
      if (value is Map) {
        qs.add(Question.fromMap(key.toString(), value));
      }
    });
    print("Response code: ${resp.statusCode}");
    print("Response body: ${resp.body}");
    print("Loaded questions count: ${qs.length}");
    return qs;
  }
}