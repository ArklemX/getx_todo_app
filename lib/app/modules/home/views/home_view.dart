import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import 'package:get/get.dart';
import 'package:getx_todo_app/app/widgets/add_dialog.dart';
import 'package:getx_todo_app/core/utils/extensions.dart';
import 'package:getx_todo_app/core/values/colors.dart';
import 'package:getx_todo_app/app/data/models/task.dart';
import 'package:getx_todo_app/app/widgets/add_card.dart';
import 'package:getx_todo_app/app/widgets/task_card.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            Padding(
              padding: EdgeInsets.all(4.0.wp),
              child: Text(
                'My List',
                style:
                    TextStyle(fontSize: 24.0.sp, fontWeight: FontWeight.bold),
              ),
            ),
            Obx(
              () => GridView.count(
                crossAxisCount: 2,
                shrinkWrap: true,
                physics: const ClampingScrollPhysics(),
                children: [
                  ...controller.tasks
                      .map(
                        (task) => LongPressDraggable(
                          data: task,
                          onDragStarted: () => controller.changeDeleting(true),
                          onDraggableCanceled: (velocity, offset) =>
                              controller.changeDeleting(false),
                          onDragEnd: (details) =>
                              controller.changeDeleting(false),
                          feedback: Opacity(
                            opacity: 0.8,
                            child: TaskCard(task: task),
                          ),
                          child: TaskCard(task: task),
                        ),
                      )
                      .toList(),
                  AddCart()
                ],
              ),
            )
          ],
        ),
      ),
      floatingActionButton: DragTarget(
        builder: (context, candidateData, rejectedData) {
          return Obx(
            () => FloatingActionButton(
              backgroundColor: controller.deleting.isTrue ? Colors.red : blue,
              onPressed: controller.deleting.isTrue
                  ? null
                  : () {
                      if (controller.tasks.isNotEmpty) {
                        Get.to(() => AddDialog(),
                            transition: Transition.downToUp);
                      } else {
                        EasyLoading.showInfo('Please, create a task type');
                      }
                    },
              child:
                  Icon(controller.deleting.isTrue ? Icons.delete : Icons.add),
            ),
          );
        },
        onAccept: (Task task) {
          controller.deleteTask(task);
          EasyLoading.showSuccess('Deleted Successfully');
        },
      ),
    );
  }
}
