import 'package:database/app/data/databaseserver.dart';
import 'package:database/app/data/entity_student.dart';
import 'package:database/app/modules/login/views/login_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  //TODO: Implement LoginController
  final GlobalKey<FormState> form_loginkey_controller = GlobalKey<FormState>();
  late TextEditingController txt_namecontroller,
      txt_agecontroller,
      txt_addresscontroller,txt_keycontroller;

 var list_modeldata=<entity_student>[].obs;
 var update_flag=false.obs;
 var update_entityid=0;
  @override
  void onInit() {
    super.onInit(); 
    txt_namecontroller = TextEditingController();
    txt_agecontroller = TextEditingController();
    txt_addresscontroller = TextEditingController();
    txt_keycontroller=TextEditingController();
    getallemployee();
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
    txt_keycontroller.dispose();}
  
  dynamic getallemployee() {
    list_modeldata.value=databaseserver().getallemployee();
  
  }

  void addnew() { update_flag.value=false;
  update_entityid=0;
  Get.bottomSheet(LoginView().designwidget());}
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
      id:update_entityid,
        name: txt_namecontroller.text,
        age: int.tryParse(txt_agecontroller.text) ?? 0,
        address: txt_addresscontroller.text);
        databaseserver().insertupdateemployee(model:data);
        cleardata();
        Get.back();
        getallemployee();
  }
  
  void cleardata() {
    txt_namecontroller.clear();
    txt_agecontroller.clear();
    txt_addresscontroller.clear();
  }

  void deleteEmployee(int id) {
    databaseserver().deleteEmployee(rowid: id);
    getallemployee();
  }

  void editemployee(entity_student list_modeldata) {
    update_flag.value=true;
    update_entityid=list_modeldata.id;
    txt_addresscontroller.text=list_modeldata.address;
    txt_agecontroller.text=list_modeldata.age.toString();
    txt_namecontroller.text=list_modeldata.name;
    Get.bottomSheet(LoginView().designwidget());

  }

  dynamic search() {
    var key=txt_keycontroller.text;
    List model=databaseserver().search(searchkey: key);
  return model;
    
  }

  

  
}
