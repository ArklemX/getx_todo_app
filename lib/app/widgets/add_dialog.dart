import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_todo_app/app/modules/home/controllers/home_controller.dart';

class AddDialog extends StatelessWidget {
  final homeCtrl = Get.find<HomeController>();
  AddDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                  onPressed: () => Get.back(), icon: const Icon(Icons.close))
            ],
          )
        ],
      ),
    );
  }
}
