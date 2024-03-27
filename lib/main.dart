import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:mvc_post_api/view/DispatchScreen.dart';
import 'package:mvc_post_api/view/GRNScreen.dart';
import 'package:mvc_post_api/view/LoginPage.dart';
import 'package:mvc_post_api/view/OutQCScreen.dart';
import 'package:mvc_post_api/view/PackScreen.dart';
import 'package:mvc_post_api/view/PickingScreen.dart';
import 'package:mvc_post_api/view/PutAwayScreen.dart';
import 'package:mvc_post_api/view/QCScreen.dart';

void main() {

  runApp(const MyApp());

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.lightBlue),
        useMaterial3: true,

      ),
      home:  LoginPage(),
      getPages: [
        GetPage(name: '/grn', page: () => GRNScreen()),
        GetPage(name: '/qc', page: () => QCScreen()),
        GetPage(name: '/put_away', page: () => PutAwayScreen()),
        GetPage(name: '/picking', page: () => PickingScreen()),
        GetPage(name: '/out_qc', page: () => OutQCScreen()),
        GetPage(name: '/pack', page: () => PackScreen()),
        GetPage(name: '/dispatch', page: () => DispatchScreen()),
      ],
    );
  }
}
