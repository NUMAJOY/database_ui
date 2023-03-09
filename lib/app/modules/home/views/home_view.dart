import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('HomeView'),
          centerTitle: true,
        ),
        body: Container(
            child: Form(
          key: controller.form_loginkey_controller,
          child: Column(
            children: [
              TextFormField(
                  controller: controller.txt_namecontroller,
                  decoration: InputDecoration(labelText: 'name'),
                  validator: (value) {
                    controller.validatename(value!);
                  }),
              TextFormField(
                controller: controller.txt_agecontroller,
                decoration: InputDecoration(labelText: 'age'),
                validator: (value) {
                  controller.validateage(value!);
                },
              ),
              TextFormField(
                controller: controller.txt_addresscontroller,
                decoration: InputDecoration(labelText: 'address'),
                validator: (value) {
                  controller.vaidateaddress(value!);
                },
              ),
              FloatingActionButton(
                onPressed: () {
                  controller.checklogin();
                },
                child: Text('save'),
              )
            ],
          ),
        )));
  }
}
