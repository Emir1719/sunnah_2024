import 'dart:convert';

class TaskModel {
  final String id;
  final String title;
  final String description;
  int isComplete;

  TaskModel({
    required this.id,
    required this.title,
    required this.description,
    required this.isComplete,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'description': description,
      'isComplete': isComplete,
    };
  }

  factory TaskModel.fromMap(Map<String, dynamic> map) {
    return TaskModel(
      id: map['id'].toString(),
      title: map['title'],
      description: map['description'],
      isComplete: map['isComplete'],
    );
  }

  String toJson() => json.encode(toMap());

  factory TaskModel.fromJson(Map<String, dynamic> json) => TaskModel.fromMap(json);
}
