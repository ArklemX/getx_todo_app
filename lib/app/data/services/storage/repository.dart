import 'package:getx_todo_app/app/data/providers/task/providers/task_provider.dart';

import '../../models/task.dart';

class TaskRepository {
  TaskProvider taskProvider;
  TaskRepository({required this.taskProvider});

  List<Task> readTasks() => taskProvider.readTasks();

  void writeTasks(List<Task> tasks) => taskProvider.writeTask(tasks);
}
