import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:getx_todo_app/app/data/models/task.dart';
import 'package:getx_todo_app/app/data/services/storage/repository.dart';

class HomeController extends GetxController {
  TaskRepository taskRepository;
  HomeController({required this.taskRepository});

  final formKey = GlobalKey<FormState>();
  final editController = TextEditingController();
  final chipIindex = 0.obs;
  final tasks = <Task>[].obs;
  final deleting = false.obs;
  final task = Rx<Task?>(null);

  @override
  void onInit() {
    super.onInit();

    tasks.assignAll(taskRepository.readTasks());
    ever(tasks, (callback) => taskRepository.writeTasks(tasks));
  }

  @override
  void onClose() {
    editController.dispose();
    super.onClose();
  }

  void changeChipIndex(value) {
    chipIindex.value = value;
  }

  void changeDeleting(bool value) {
    deleting.value = value;
  }

  void changeTask(Task? selectedTask) {
    task.value = selectedTask;
  }

  bool addTask(Task task) {
    if (!tasks.contains(task)) {
      tasks.add(task);
      return true;
    } else {
      return false;
    }
  }

  void deleteTask(Task task) {
    tasks.remove(task);
  }

  updateTask(Task task, String title) {
    var todos = task.todos ?? [];

    if (containTodo(todos, title)) {
      return false;
    } else {
      var todo = {'title': title, 'done': false};
      todos.add(todo);
      var newTask = task.copyWith(todos: todos);
      int oldIdx = tasks.indexOf(task);
      tasks[oldIdx] = newTask;
      tasks.refresh(); 

      return true;
    }
  }

  bool containTodo(List todos, String title) {
    return todos.any((element) => element['title'] == title);
  }
}
