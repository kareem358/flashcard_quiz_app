// will create a question model here

class Question{
  // create the structure of the question
  //every question will get an id

  final String id;
  // there must be a title of the question so
  final String title;
  // options for the question
  final Map <String, bool> options;
  // option  will be like - {'1': true, '2':false} = like so
  Question({
    required this.id,
    required this.title,
    required this.options,
});
  factory Question.fromMap(Map<String, dynamic> map) {
    return Question(
      id: map['id'],
      title: map['title'],
      options: Map<String, bool>.from(map['options']),
    );
  }
  // override the tostring method to print the question on console
  @override
  String toString() {
    // TODO: implement toString
    //return super.toString();
    return 'Question(id: $id, title: $title, options: $options )';
  }
}
/*to be written instead of override and string method
  factory Question.fromMap(Map<String, dynamic> map) {
    return Question(
      id: map['id'],
      title: map['title'],
      options: Map<String, bool>.from(map['options']),
    );
  }
*/