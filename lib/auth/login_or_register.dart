import 'package:flutter/material.dart';
import 'package:task_management01/pages/login_page.dart';
import 'package:task_management01/pages/register.dart';

class LoginOrRegister extends StatefulWidget {
  const LoginOrRegister({super.key});

  @override
  State<LoginOrRegister> createState() => _LoginOrRegisterState();
}

class _LoginOrRegisterState extends State<LoginOrRegister> {

  //initial
  bool showLoginPage = true;

  //toggle between pages
  void togglePages(){
    setState(() {
      showLoginPage = !showLoginPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showLoginPage){
      return LoginPage(onTap: togglePages);
    }else {
      return RegisterPage(onTap: togglePages);
    }
  }
}