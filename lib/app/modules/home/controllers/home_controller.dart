import 'package:database/app/data/databaseserver.dart';
import 'package:database/app/data/entity_student.dart';
import 'package:database/app/routes/app_pages.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController
  final GlobalKey<FormState> form_loginkey_controller = GlobalKey<FormState>();
  late TextEditingController txt_namecontroller,
      txt_agecontroller, 
      txt_addresscontroller;

  @override
  void onInit() {
    super.onInit();
    txt_namecontroller = TextEditingController();
    txt_agecontroller = TextEditingController();
    txt_addresscontroller = TextEditingController();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    txt_namecontroller.dispose();
    txt_agecontroller.dispose();
    txt_addresscontroller.dispose();
  }

  void checklogin() {
    final isvalid = form_loginkey_controller.currentState!.validate();
    if (!isvalid) {
      return;
    } else {
      press();
    }
  }

  String? validatename(String s) {
    if (s.length > 4) {
      return ('provide valid name');
    } else {
      return null;
    }
  }

  String? validateage(String s) {
    if (s.length > 2) {
      return ('provide valid age');
    } else {
      return null;
    }
  }

  String? vaidateaddress(String s) {
    if (s.length > 6) {
      return ('provide valid address');
    } else {
      return null;
    }
  }

  void press() {
    var data = entity_student(
        name: txt_namecontroller.text,
        age: int.tryParse(txt_agecontroller.text) ?? 0,
        address: txt_addresscontroller.text);
        databaseserver().insertupdateemployee(model:data);
        get();
  }
  
  void get() {
    Get.toNamed(Routes.LOGIN);
  }
}
