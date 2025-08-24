import 'dart:convert';
import 'package:http/http.dart' as http;
import './question_model.dart';
    final resp = await http.get(url);
    final raw = json.decode(resp.body);
    if (raw is! Map) return [];

    final qs = <Question>[];
    raw.forEach((key, value) {
      if (value is Map) {
        qs.add(Question.fromMap(key.toString(), value));
      }
    });

    return qs;
  }
}