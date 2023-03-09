import 'package:database/app/data/databaseserver.dart';
import 'package:database/app/data/entity_student.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart' show GetMaterialApp;

import 'app/routes/app_pages.dart';

Future<void>main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await databaseserver.initilizedb();
  var data=entity_student(name:'ade',age: 12,address: 'ert' );
  databaseserver().insertupdateemployee(model:data);
  
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Application",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    ),
  );
  }
