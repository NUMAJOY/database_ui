import 'package:get/get.dart';

import '../controllers/loginpage2_controller.dart';

class Loginpage2Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<Loginpage2Controller>(
      () => Loginpage2Controller(),
    );
  }
}
