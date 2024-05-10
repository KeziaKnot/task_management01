import 'package:flutter/material.dart';
import 'package:task_management01/components/buttons.dart';
import 'package:task_management01/components/text_field.dart';
import 'package:task_management01/pages/homepage.dart';

class RegisterPage extends StatefulWidget {
  final Function()? onTap;
  const RegisterPage({
    super.key,
    required this.onTap,
  });

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  
  //text controller
  final emailTextController = TextEditingController();
  final passwordTextController = TextEditingController();
  final confirmPasswordTextController = TextEditingController();

  void registerUser() {
  // Retrieve the email and password from the text controllers
  //String email = emailTextController.text;
  //String password = passwordTextController.text;

  // Perform sign-in logic here, such as calling a method to authenticate the user
  // For example:
  // authService.signIn(email, password);

  // After successfully signing in, you can navigate to the next page
  //go to profile page
    Navigator.push(
      context, 
      MaterialPageRoute(
        builder: (context) => const HomePage(),
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //logo
                Icon(
                  Icons.add_task,
                  size: 100,
                ),
                const SizedBox(height: 50),
                //Welcome message
                Text(
                  "Create an Account!",
                  style: TextStyle(
                        color: Colors.grey[700],
                      ),
                ),
          
                const SizedBox(height: 25),
                //email textfeild
                MyTextField(
                  controller: emailTextController, 
                  hintText: 'Email', 
                  obscureText: false,
                ),

                const SizedBox(height: 10),
                //password textfield
                MyTextField(
                  controller: passwordTextController, 
                  hintText: 'Password', 
                  obscureText: true,
                ),

                const SizedBox(height: 10),
                //confirm password textfield
                MyTextField(
                  controller: confirmPasswordTextController, 
                  hintText: 'Confirm Password', 
                  obscureText: true,
                ),

                const SizedBox(height: 10),
                //sign in button
                MyButton(
                  text: 'Sign Up', 
                  onPressed: registerUser,
                ),
                
                const SizedBox(height: 25),
                //Register page
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already Have an account?",
                      style: TextStyle(
                        color: Colors.grey[700],
                      ),
                    ),
                    const SizedBox(width: 4),
                    GestureDetector(
                      onTap: widget.onTap,
                      child: const Text(
                        "Login Here",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.blue,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}