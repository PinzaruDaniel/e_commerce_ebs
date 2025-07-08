import 'package:e_commerce_ebs/presentation/home_page/home_page.dart';
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
        scaffoldBackgroundColor: Colors.white,
        fontFamily: 'Nunito-Sans',
        useMaterial3: true,
      ),
      initialRoute: "/",
      //home: HomePage(),
      getPages: [
        GetPage(name: "/", page: ()=> HomePage())
      ],
    );
  }
}