import 'package:flutter/material.dart';
import 'package:task_management01/components/text_box.dart';
import 'package:task_management01/pages/login_page.dart';
import 'package:task_management01/data/database.dart';
import 'package:hive_flutter/hive_flutter.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  //final currentUser = LoginPage.emailTextController;

  final _myBox = Hive.box('mybox');
  todoDatabase db = todoDatabase();
  //edit field
  Future<void> editfield(String field) async{
    String newValue = "";
    await showDialog(
      context: context, 
      builder: (context) => AlertDialog(
        backgroundColor: Colors.grey[900],
        title: Text(
          "Edit $field",
          style: const TextStyle(color: Colors.white30),
        ),
        content: TextField(
          autofocus: true,
          style: TextStyle(color: Colors.white30),
          decoration: InputDecoration(
            hintText: "Enter new $field",
            hintStyle: TextStyle(color: Colors.grey),
          ),
          onChanged: (value){
            newValue = value;
          },
        ),
        actions: [
          //cancel
          TextButton(
            onPressed: () => Navigator.pop(context), 
            child: Text(
              'Cancel',
              style: TextStyle(color: Colors.white30),
            ),
          ),
          //save
          TextButton(
            onPressed: () => Navigator.of(context).pop(newValue), 
            child: Text(
              'Save',
              style: TextStyle(color: Colors.white30),
            ),
          ),
        ],
      ),
    );

    //update the database
    if (newValue.trim().length > 0){
      Navigator.of(context).pop();
      db.updateBio(newValue);
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
        backgroundColor: Colors.grey[900],
      ),
      backgroundColor: Colors.grey[300],
      body: ListView(
        children: [
          const SizedBox(height: 50),
          //profile pic
          Icon(
            Icons.person,
            size: 72,
          ),
          //const SizedBox(height: 50),
          //username
          MyTextBox(
            text: 'Kezia',
            sectionName: 'username',
            onPressed: () => editfield('username'),
          ),
          //const SizedBox(height: 10),
          //bio
          MyTextBox(
            text: 'Empty Bio',
            sectionName: 'bio',
            onPressed: () => editfield('bio'),
          ),

        ],
      ),

    );
  }
}