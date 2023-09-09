import 'dart:convert';
import 'package:sunnah_2024/models/task_model.dart';
import 'package:flutter/services.dart' show rootBundle;

class TaskService {
  /*final String _url = "https://raw.githubusercontent.com/Emir1719/Sunnah-Data/main/data.json";

  Future<List<TaskModel>> getTasksNetwork() async {
    List<TaskModel> list = [];
    try {
      var result = await Dio().get(_url);
      var taskList = jsonDecode(result.data);
      if (taskList is List) {
        list = taskList.map((e) => TaskModel.fromJson(e)).toList();
      }
    } catch (e) {
      print(e);
    }
    return list;
  }*/

  ///Jsondaki veriyi liste olarak döndürür.
  Future<List<TaskModel>> getTasksLocal() async {
    final String response = await rootBundle.loadString('assets/data/data.json');
    final data = json.decode(response) as List<dynamic>;
    return data.map<TaskModel>((json) => TaskModel.fromJson(json)).toList();
  }
}
