import 'package:get/get.dart';

import 'package:database/app/modules/home/bindings/home_binding.dart';
import 'package:database/app/modules/home/views/home_view.dart';
import 'package:database/app/modules/login/bindings/login_binding.dart';
import 'package:database/app/modules/login/views/login_view.dart';
import 'package:database/app/modules/loginpage2/bindings/loginpage2_binding.dart';
import 'package:database/app/modules/loginpage2/views/loginpage2_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.LOGINPAGE2,
      page: () => Loginpage2View(),
      binding: Loginpage2Binding(),
    ),
  ];
}
