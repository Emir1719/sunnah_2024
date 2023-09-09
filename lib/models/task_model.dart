import 'dart:convert';
import 'package:sunnah_2024/models/option.dart';

class TaskModel {
  final String id;
  final String title;
  final String description;
  final String? link; //Youtube short video linki
  Option option; //Görev tamamlanma bilgisi

  TaskModel({
    required this.id,
    required this.title,
    required this.description,
    this.link,
    this.option = Option.uncompleted,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'description': description,
      'link': link,
      'option': option,
    };
  }

  factory TaskModel.fromMap(Map<String, dynamic> map) {
    return TaskModel(
      id: map['id'].toString(),
      title: map['title'],
      description: map['description'],
      link: map['link'] != null ? map['link'] as String : null,
      option: Option.uncompleted, //Varsayılan değer olarak uncompleted atandı.
    );
  }

  String toJson() => json.encode(toMap());

  factory TaskModel.fromJson(Map<String, dynamic> json) => TaskModel.fromMap(json);
}
