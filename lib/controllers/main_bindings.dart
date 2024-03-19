import 'package:get/get.dart';
import 'package:login_test/controllers/main_controller.dart';

class MainBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(MainController(), permanent: true);
  }
}
