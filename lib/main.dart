import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:getx_todo_app/app/data/services/storage/repository.dart';

import 'app/routes/app_pages.dart';

Future<void> main() async {
  await GetStorage.init();
  await Get.putAsync(() => StorageService().init());
  runApp(
    GetMaterialApp(
      title: "Application",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    ),
  );
}
