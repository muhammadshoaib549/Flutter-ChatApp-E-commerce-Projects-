import 'package:flutter/material.dart';
import 'package:flutter_application_1/Utilities/DialogBox.dart';
import 'package:flutter_application_1/Utilities/todotile.dart';

class Homepage extends StatefulWidget {
  // This is the Constructor here
  Homepage({super.key});

  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  // Save New Task Method is Here

  final _controller = TextEditingController();
  // A TODO list
  List todolist = [
    // This is for the First Number
    ["Cleaning Room", false], // -------> this is the index nUmber 0
    ["Coding", true], // ---------> this is the index nUmber 1
    ["Watching Movies", false], // ---------> this is the index nUmber 2
    ["Pusing to positive World", true],
  ];
  // This is the Method to Check the Chek Box Chnaged or the not
  void checkboxChanged(bool? value, int index) {
    setState(() {
      // Means to Say We Can not Have the Two of the Same Indexes
      todolist[index][1] != todolist[index][1];
    });
  }

  void SaveNewTask() {
    setState(() {
      // Means to Say that Text and the Current Value
      todolist.add([_controller.text, false]);
      // It Will Clear the Filed After the Working Has Been Done

      _controller.clear();
    });
    Navigator.of(context).pop();
  }

  // Method
  void createNewTask() {
    showDialog(
      context: context,
      builder: (context) {
        return Dialogbox(
          controller: _controller,
          // Now Lets use here the both of that Methods
          onSave: SaveNewTask,
          onignore: Navigator.of(context).pop,
        );
      },
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 177, 234, 5),
      appBar: AppBar(
        // Shadow of the App Bar
        elevation: 100,
        backgroundColor: const Color.fromARGB(255, 190, 206, 14),
        title: Text(
          "Tasks Manager ",
          style: TextStyle(
            color: const Color.fromARGB(255, 180, 11, 11),
            fontSize: 30,
            // This is for the Shadow of the Text
            shadows: [
              Shadow(
                offset: Offset(2, 2), // how far the shadow moves
                blurRadius: 4, // how soft the shadow is
                color: Colors.black, // shadow color
              ),
            ],
          ),
        ),
        centerTitle: true,
      ),
      // A Floating Action Button For the Adding of the New Tasks
      floatingActionButton: FloatingActionButton(
        // Here We Are Going to Call the Function Named the Create New Task That Will be the Responsible for Making the New Task
        onPressed: () {
          createNewTask();
        },
        child: Icon(Icons.add),
      ),
      // This is the Body of the
      body: Center(
        child: Center(
          //Now Lets Change this List View to the List View . builder
          child: ListView.builder(
            // How many We Want to Build
            itemCount: todolist.length,
            // Waht to build
            itemBuilder: (context, index) {
              return Todotile(
                taskName: todolist[index][0],
                TaskCompletedorNot: todolist[index][1],
                onChanged: (value) => checkboxChanged(value, index),
              );
            },
          ),
        ),
      ),
    );
  }
}
