
import 'package:e_commerce_ebs/pages/home_page/home_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context){
    return GetMaterialApp(
      title: 'Food Recipe App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        bottomSheetTheme: BottomSheetThemeData(
          dragHandleColor: Colors.grey.shade300,
        ),
        scaffoldBackgroundColor: Colors.white,
        fontFamily: 'Nunito-sans',
        useMaterial3: true,
      ),
      initialRoute: "/",
      getPages: [
        GetPage(name: "/", page: ()=> HomePage())
      ],
    );
  }
}