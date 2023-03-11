import 'dart:convert';
import 'dart:developer';

import 'package:get/get.dart';

import 'package:getx_todo_app/core/utils/keys.dart';
import 'package:getx_todo_app/app/data/models/task.dart';
import 'package:getx_todo_app/app/data/services/storage/repository.dart';

import '../../../services/storage/services.dart';

class TaskProvider {
  final StorageService _storageService = Get.find<StorageService>();

  List<Task> readTasks() {
    List<Task> tasks = <Task>[];

    try {
      jsonDecode(_storageService.read(taskKey).toString())
          .forEach((e) => tasks.add(Task.fromJson(e)));
    } on Exception catch (e) {
      //Put the exception inside the logs
      log(e.toString());
    }

    return tasks;
  }

  void writeTask(List<Task> tasks) {
    _storageService.write(taskKey, jsonEncode(tasks));
  }
}
