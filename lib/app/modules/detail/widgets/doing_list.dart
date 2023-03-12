import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_todo_app/app/modules/home/controllers/home_controller.dart';
import 'package:getx_todo_app/core/utils/extensions.dart';

class DoingList extends StatelessWidget {
  final homeCtrl = Get.find<HomeController>();
  DoingList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => homeCtrl.doingTodos.isEmpty && homeCtrl.doneTodos.isEmpty
          ? Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(3.0.wp),
                  child: Image.asset(
                    'assets/images/add_tasks.png',
                    fit: BoxFit.cover,
                    width: 65.0.wp,
                  ),
                ),
                Text(
                  'Add a task',
                  style:
                      TextStyle(fontSize: 16.0.sp, fontWeight: FontWeight.bold),
                )
              ],
            )
          : ListView(
              shrinkWrap: true,
              physics: ClampingScrollPhysics(),
              children: [
                ...homeCtrl.doingTodos
                    .map((element) => Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: 3.0.wp, horizontal: 9.0.wp),
                          child: Row(
                            children: [
                              SizedBox(
                                width: 20,
                                height: 20,
                                child: Checkbox(
                                  fillColor: MaterialStateProperty.resolveWith(
                                      (states) => Colors.grey),
                                  value: element['done'],
                                  onChanged: (value) {
                                    homeCtrl.doneTodo(element[
                                        'title']); // Implement donTodo()
                                  },
                                ),
                              ),
                              Padding(
                                padding:
                                    EdgeInsets.symmetric(horizontal: 4.0.wp),
                                child: Text(
                                  element['title'],
                                  overflow: TextOverflow.ellipsis,
                                ),
                              )
                            ],
                          ),
                        ))
                    .toList(),
                if (homeCtrl.doneTodos.isNotEmpty)
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 5.0.wp),
                    child: const Divider(thickness: 2),
                  )
              ],
            ),
    );
  }
}
