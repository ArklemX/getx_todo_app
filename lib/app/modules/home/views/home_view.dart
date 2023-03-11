import 'package:flutter/material.dart';

import 'package:get/get.dart';
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
                      .map((task) => TaskCard(task: task))
                      .toList(),
                  AddCart()
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
