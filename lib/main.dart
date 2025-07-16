import 'package:e_commerce_ebs/controllers/bindings/root_bindings_controllers.dart';
import 'package:e_commerce_ebs/controllers/controller_imports.dart';
import 'package:e_commerce_ebs/pages/home_page/home_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async {
  await RootBinding().dependencies();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Food Recipe App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        bottomSheetTheme: BottomSheetThemeData(dragHandleColor: Colors.grey.shade300),
        scaffoldBackgroundColor: Colors.white,
        fontFamily: 'Nunito-sans',
        useMaterial3: true,
      ),
      initialRoute: "/",
      getPages: [GetPage(name: "/", page: () => HomePage())],
    );
  }
}
