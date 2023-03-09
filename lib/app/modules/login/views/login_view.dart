import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
              onPressed: () {
                Get.defaultDialog(
                    content: Column(children: [
                  TextFormField(
                    controller: controller.txt_keycontroller,
                    decoration: InputDecoration(labelText: 'key'),
                  ),
                  ElevatedButton(
                      onPressed: () {
                        Get.bottomSheet(    
                          backgroundColor: Colors.lightGreen,
                          Container(
                            child: ListView.builder(
                                itemCount: controller.search().length,
                                itemBuilder: (context, index) {
                                  return ListTile(
                                    title:
                                        Text('${controller.search()[index].name}'),
                                  subtitle: Text('${controller.search()[index].age}'),);
                                }),
                          ),
                        );
                      },
                      child: Text('Search'))
                ]));
              },
              icon: Icon(Icons.search),
            ),
            IconButton(
                onPressed: () {
                  controller.addnew();
                },
                icon: Icon(Icons.add))
          ],
          title: Text('LoginView'),
          centerTitle: true,
        ),
        body: Obx(() => ListView.builder(
            itemCount: controller.list_modeldata.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(controller.list_modeldata[index].name),
                subtitle: Text(
                    ' ${controller.list_modeldata[index].address} => ${controller.list_modeldata[index].age}'),
                trailing: FittedBox(
                  child: Row(
                    children: [
                      IconButton(
                          onPressed: () {
                            controller.deleteEmployee(
                                controller.list_modeldata[index].id);
                          },
                          icon: Icon(Icons.recycling)),
                      IconButton(
                          onPressed: () {
                            controller
                                .editemployee(controller.list_modeldata[index]);
                          },
                          icon: Icon(Icons.edit))
                    ],
                  ),
                ),
              );
            })));
  }

  Widget designwidget() {
    return Material(
        child: Container(
            height: 500,
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
                  Obx(() => FloatingActionButton(
                        child: controller.update_flag.value != true
                            ? Text('save')
                            : Text('update'),
                        onPressed: () {
                          controller.checklogin();
                        },
                      ))
                ],
              ),
            )));
  }
}
