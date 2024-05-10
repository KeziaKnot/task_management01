import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:task_management01/components/dialog_box.dart';
import 'package:task_management01/components/drawer.dart';
import 'package:task_management01/components/task_tile.dart';
import 'package:task_management01/data/database.dart';
import 'package:task_management01/pages/login_page.dart';
import 'package:task_management01/pages/profile.dart';
import 'package:task_management01/auth/login_or_register.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //hive box
  final _myBox = Hive.box('mybox');
  todoDatabase db = todoDatabase();

  @override
  void initState() {
    // TODO: implement initState
    //first time user
    if (_myBox.get("TASKLIST") == null){
      db.createInitialData();
    }else{
      //recurring user
      db.loadData();
    }
    super.initState();
  }

  //text controller
  final _controller = TextEditingController();
  
  //checkbox clicked
  void checkboxClicked(bool? value, int index) {
    setState(() {
      db.taskList[index][1] = !db.taskList[index][1];
    });
    db.updateDatabase();
  }

  void saveNewTask() {
    setState(() {
      db.taskList.add([_controller.text, false]);
      _controller.clear();
    });
    Navigator.of(context).pop();
    db.updateDatabase();
  }

  //create new task
  void createNewTask() {
    showDialog(
        context: context,
        builder: (context) {
          return DialogBox(
            controller: _controller,
            onSave: saveNewTask,
            onCancel: () => Navigator.of(context).pop(),
          );
        });
  }

  void deleteTask(int index){
    setState(() {
      db.taskList.removeAt(index);
    });
    db.updateDatabase();
  }

  void goToProfile() {
    //pop the menu drawer
    Navigator.pop(context);
    //go to profile page
    Navigator.push(
      context, 
      MaterialPageRoute(
        builder: (context) => const ProfilePage(),
      )
    );
  }

  void signOut() {
  // pop the menu drawer
  Navigator.pop(context);
  // navigate to the login page
  _goToLoginPage(context);
  }

  void _goToLoginPage(BuildContext context) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) =>  LoginPage(onTap: () {})),
  );
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFBCE6FF),
      drawer: MyDrawer(
        onProfileTap: goToProfile,
        onSignOut: signOut,
      ),
      appBar: AppBar(
        title: Text('Tasks'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: createNewTask,
        child: Icon(Icons.add),
      ),
      body: ListView.builder(
        itemCount: db.taskList.length,
        itemBuilder: (context, index) {
          return TodoTile(
            taskName: db.taskList[index][0],
            taskCompleted: db.taskList[index][1],
            onChanged: (value) => checkboxClicked(value, index),
            deleteFunction: (context) => deleteTask(index),
          );
        },
      ),
    );
  }
}
