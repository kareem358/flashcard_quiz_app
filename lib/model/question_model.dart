
class Question {
  final String id;
  final String title;
  final Map<String, bool> options;

  Question({
    required this.id,
    required this.title,
    required this.options,
  });


  factory Question.fromMap(String id, Map<dynamic, dynamic> map) {
    final title = map['title']?.toString() ?? '';
    final rawOptions = map['options'] as Map<dynamic, dynamic>? ?? {};
    final parsedOptions = <String, bool>{};
    rawOptions.forEach((key, value) {
      parsedOptions[key.toString()] = value == true;
    });

    return Question(
      id: id,
      title: title,
      options: parsedOptions,
    );
  }

  @override
  String toString() => 'Question(id: $id, title: $title, options: $options)';
}