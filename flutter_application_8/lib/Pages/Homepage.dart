import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_8/Components/Usertile.dart';
import 'package:flutter_application_8/Pages/ChatPage.dart';
import 'package:flutter_application_8/Services/Auth/authservice.dart';
import 'package:flutter_application_8/Components/mydrawer.dart';
import 'package:flutter_application_8/Services/Chat/chatservices.dart';

class Homepage extends StatelessWidget {
  // Lets Now Work on the Chat and the Auth Services
  final Chatservices _chatservices = Chatservices();
  final authservice _authServices = authservice();

  // This is the Function for the Signing out from the HomePage
  void Logout() {
    // Getting the Auth Service Here
    final _auth = authservice();
    // Calling the Method From the Services Class tHATS name Was  the Sign out
    _auth.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Setted the Primary color as the BG color to the Home Page
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        backgroundColor: Colors.grey,
        title: Text(
          "Home Page ",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),

      // From Here We will Start thee Major Working of the App
      //Now lets Make the Drawer for the HomePage
      drawer: Mydrawer(),
      body: _buildUserlist(),
    );
  }

  Widget _buildUserlist() {
    return StreamBuilder<List<Map<String, dynamic>>>(
      stream: _chatservices.getUserStream(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Text("Facing Error");
        }
        // This is for the Loading
        // Means to Say if there is Some Kind oof Wait
        if (snapshot.connectionState == ConnectionState.waiting) {
          // This Will Load the Icon of the Searching Until The State Is Not Loading
          return Icon(Icons.search);
        }

        // Finally We will Return the list Now
        // return list view
        return ListView.builder(
          itemCount: snapshot.data!.length,
          itemBuilder: (context, index) {
            final userData = snapshot.data![index];
            return _buildUserListItem(userData, context);
          },
        ); // ListView
        // ListView
      },
    ); // This is the Stream Builder for the User List
  }

  Widget _buildUserListItem(
    Map<String, dynamic> userdata,
    BuildContext context,
  ) {
    // Means if the User Will Login By using the Email Shoaib@gmail.com then You will never See it on the Home Page 
    // Displaying the User Except the Current User
    if (userdata["email"] != _authServices.getcurrentUser()?.email) {
      return Usertile(
        text: userdata["email"],
        OnTapp: () {
          // Here We will Navigate to the Chat Page
          Navigator.push(
            context,
// On tap this Will GO to the CHat page 
            // Here We will Define the the Page Routing
            // Wr have Built the Chat Page on the Other Side of the project
            // And Wee Also Have passed the Email to the The Chat page to have the Track of the User
            MaterialPageRoute(
              // Passing the Both of the Attributs of the Chat Page class
              builder:
                  (context) => Chatpage(
                    RecieverEmail: userdata["email"],
                    RecieverID: userdata["uid"],
                  ),
            ),
          );
        },
      );
    } else {
      // Agar current user ka email aata hai to usko skip karna hai
      return SizedBox.shrink();
    }
  }
}
