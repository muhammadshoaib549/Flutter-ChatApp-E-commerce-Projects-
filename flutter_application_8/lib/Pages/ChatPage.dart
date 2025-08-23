import 'package:flutter/material.dart';
import 'package:flutter_application_8/Components/ChatBubble.dart';
import 'package:flutter_application_8/Components/TextFields.dart';
import 'package:flutter_application_8/Services/Auth/authservice.dart';
import 'package:flutter_application_8/Services/Chat/chatservices.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Chatpage extends StatelessWidget {
  // This is for the Users Email
  final String RecieverEmail;
  final String RecieverID;

  Chatpage({super.key, required this.RecieverEmail, required this.RecieverID});

  // This is  text Controller
  final TextEditingController _messageController = TextEditingController();
  // These Are for the Services of the Chats Here
  final Chatservices _chatservices = Chatservices();
  // this is for the Services of the Auth Services
  final authservice _authservices = authservice();

  // Method for the Seding of the Message
  void SendMessage() async {
    // Means Message Controller Can not Be empty
    if (_messageController.text.isNotEmpty) {
      // After the Waiting of the Some time I will Send the Using These THings hhahahah
      await _chatservices.sendMessage(RecieverID, _messageController.text);
      // After the Sending of the Message I will Clear the Message Controller
      _messageController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Here We will pass the User Email that has been described Earlier in this File
      appBar: AppBar(title: Text(RecieverEmail)),
      backgroundColor: const Color.fromARGB(255, 238, 114, 114),
      body: Container(
        child: Column(
          children: [
            Expanded(child: _buildmessagelist()),

            // Users Inout We will pass it in the Main Scaffold
            _buildUserInput(),
          ],
        ),
      ),
    );
  }

  // Here in this Widget We will Build Every thing for the _buildmessagelist
  Widget _buildmessagelist() {
    //Here the Auth Services is the Class And the we Know the getcureentUser is the method there And uid is having the Users Id
    String _senderID = _authservices.getcurrentUser()!.uid;

    return StreamBuilder<QuerySnapshot>(
      stream: _chatservices.getMessage(_senderID, RecieverID),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Text("Facing Issue! Can not be Empty");
        }
        // This is for if the  Snap Shot is in the Loading Face
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Icon(Icons.search_outlined);
        }
        // At the End WE will Return the List View for the Displaying of the Messages
        return ListView(
          children:
              snapshot.data!.docs
                  .map((doc) => _buildMessageitem(doc)) // ✅ fixed mapping
                  .toList(),
        );
      },
    );
  }

  // This is A widget for the _build Message Item
  Widget _buildMessageitem(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;

    return Chatbubble(message: data["message"]);
  }

  // This is the Widget for the Users Input
  Widget _buildUserInput() {
    return Row(
      children: [
        Expanded(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Textfields(
              controller: _messageController,
              hinttext: "Type Your Message",

              // This will be Visible While Working on it
              obscuretext: false,
            ),
          ),
        ),
        // Send Button
        // Here SendMessage is A Methood That as been defined in the Above
        IconButton(
          color: const Color.fromARGB(255, 5, 240, 13),
          onPressed: SendMessage,
          icon: Icon(
            Icons.arrow_upward,
            color: const Color.fromARGB(255, 7, 237, 15),
          ),
        ),
      ],
    );
  }
}
