import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:task_management01/auth/login_or_register.dart';
import 'package:task_management01/pages/homepage.dart';

void main() async {
  //initialization
  await Hive.initFlutter();
  var box = await Hive.openBox('mybox');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const LoginOrRegister(),
      theme: ThemeData(
        primaryColor: Color(0xFF015C92)),
    );
  }
}