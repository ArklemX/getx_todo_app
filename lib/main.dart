import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:getx_todo_app/app/modules/home/bindings/home_binding.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import 'app/data/services/storage/services.dart';
import 'app/routes/app_pages.dart';

Future<void> main() async {
  await GetStorage.init();
  await Get.putAsync(() => StorageService().init());
  runApp(
    GetMaterialApp(
      title: "GetX ToDo",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      builder: EasyLoading.init(),
      debugShowCheckedModeBanner: false,
    ),
  );
}
