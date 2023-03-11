import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_todo_app/app/core/utils/extensions.dart';
import 'package:getx_todo_app/app/modules/home/controllers/home_controller.dart';
import 'package:getx_todo_app/app/widgets/icons.dart';

class AddCart extends StatelessWidget {
  final homeCtrl = Get.find<HomeController>();
  AddCart({super.key});

  @override
  Widget build(BuildContext context) {
    final icons = getIcons();
    var squareWidth = Get.width - 12.0.wp;

    return Container(
      width: squareWidth / 2,
      height: squareWidth / 2,
      margin: EdgeInsets.all(3.0.wp),
      child: InkWell(
        onTap: () async {
          await Get.defaultDialog(
              titlePadding: EdgeInsets.symmetric(vertical: 5.0.wp),
              radius: 5,
              title: 'Task Type',
              content: Form(
                key: homeCtrl.formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: homeCtrl.editController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Title',
                      ),
                    )
                  ],
                ),
              ));
        },
        child: DottedBorder(
            color: Colors.grey.shade400,
            dashPattern: const [8, 4],
            child: Center(
              child: Icon(
                Icons.add,
                size: 10.0.wp,
                color: Colors.grey,
              ),
            )),
      ),
    );
  }
}
