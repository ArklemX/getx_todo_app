import 'package:flutter/foundation.dart';
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
  final doingTodos = <dynamic>[].obs;
  final doneTodos = <dynamic>[].obs;

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

  void changeTodos(List<dynamic> selected) {
    doingTodos.clear();
    doneTodos.clear();
    for (var i = 0; i < selected.length; i++) {
      var todo = selected[i];
      var status = todo['done'];

      if (status == true) {
        doneTodos.add(todo);
      } else {
        doingTodos.add(todo);
      }
    }
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

  bool addTodo(String title) {
    var todo = {'title': title, 'done': false};

    if (doingTodos
        .any((element) => mapEquals<String, dynamic>(todo, element))) {
      return false;
    }

    var doneTodo = {'title': title, 'done': true};
    if (doneTodos
        .any((element) => mapEquals<String, dynamic>(doneTodo, element))) {
      return false;
    }

    doingTodos.add(todo);
    return true;
  }

  void updateTodos() {
    var newTodos = <Map<String, dynamic>>[];
    newTodos.addAll([...doingTodos, ...doneTodos]);

    var newTask = task.value!.copyWith(todos: newTodos);
    int oldIdx = tasks.indexOf(task.value);
    tasks[oldIdx] = newTask;

    tasks.refresh();
  }

  void doneTodo(String title) {
    var doingTodo = {'title': title, 'done': false};
    int index = doingTodos.indexWhere(
        (element) => mapEquals<String, dynamic>(element, doingTodo));
    doingTodos.removeAt(index);

    var doneTodo = {'title': title, 'done': true};
    doneTodos.add(doneTodo);
    doingTodos.refresh();
    doneTodos.refresh();
  }
}
