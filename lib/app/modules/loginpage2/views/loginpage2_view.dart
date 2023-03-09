import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/loginpage2_controller.dart';

class Loginpage2View extends GetView<Loginpage2Controller> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Loginpage2View'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'Loginpage2View is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
