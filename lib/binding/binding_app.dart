import 'package:agricultureapp/controller/socket_controller.dart';
import 'package:get/get.dart';

import '../controller/luncher_controller.dart';

class BindingApp extends Bindings {
  @override
  void dependencies() {
    // lunch controller  ...
    Get.put<LuncherController>(
      LuncherController(),
    );
  }
}
