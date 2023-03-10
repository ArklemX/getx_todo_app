import 'package:get/get.dart';
import 'package:getx_todo_app/app/data/models/task.dart';
import 'package:getx_todo_app/app/data/services/storage/repository.dart';

class HomeController extends GetxController {
  TaskRepository taskRepository;
  HomeController({required this.taskRepository});

  final tasks = <Task>[].obs;

  @override
  void onInit() {
    super.onInit();

    tasks.assignAll(taskRepository.readTasks());
    ever(tasks, (callback) => taskRepository.writeTasks(tasks));
  }

  @override
  void onClose() {
    super.onClose();
  }
}
