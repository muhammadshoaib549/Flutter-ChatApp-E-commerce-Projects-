// this is the Basic Class for the Chat Services
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_application_8/models/message.dart';

class Chatservices {
  // Fire Base Intializer that Will be Used to have the Fire Base Functions Here

  // Here the Firebase Fire Store is just to have the Access of the Fire Store
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  // Instance for the Fire Base Auth

  final FirebaseAuth _auth = FirebaseAuth.instance;

  //  List<Map<String,dynamic>>
  // Lets Build a list of the Map

  // Getting the User Stream
  Stream<List<Map<String, dynamic>>> getUserStream() {
    return _firestore.collection("Users").snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        final user = doc.data();
        return user;
      }).toList();
    });
  }

  // Send Message
  // This is for the Sending the Message
  //WE will include the Two things in the Send Message Function first is the Actual Message And the Receiver ID

  Future<void> sendMessage(String receverid, String message) async {
    // Getting the Current User info(User Id and the Email and the Time On which the Message Was sent )
    final String currentUserId = _auth.currentUser!.uid;
    final String currentUserEmail = _auth.currentUser!.email!;
    final Timestamp timestamp = Timestamp.now();

    //Creating a New Message
    Message newMessage = Message(
      senderId: currentUserId,
      senderEmail: currentUserEmail,
      receiverId: receverid,
      message: message,
      timestamp: timestamp,
    );
// Every thing Store in the Form of the strings And In the Form of the List Pairs 

    //Construct the Chat Room ID for the Two of the User
    // We have Just Stored the Ids in the form of the list
    List<String> ids = [currentUserId, receverid];
    ids.sort(); // This is for the Sorting of the Ids Number Vise in the Fire Store
    // Here We have Joined them Using the Fucntion Named Join()

    String chatRoomid = ids.join();

    //Adding the New Message to the Data Base
    await _firestore
        // Stored the chat room ids to the chat rooms And the Created Object of the Message Class Here in the Below
        .collection("chat_rooms")
        .doc(chatRoomid)
        .collection("messages")
        .add(newMessage.toMap());
  }

  // Recieve Message
  Stream<QuerySnapshot> getMessage(String userID, String OtherUserID) {
    List<String> ids = [userID, OtherUserID];
    ids.sort();
    String chatRoomid = ids.join();
    /*
    It Will Return te Simply the Collection of the Chat Rooms And the Messages and the Time Stamp As the Ordering with the desending to be the false 
    */
    return _firestore
        .collection("chat_rooms")
        .doc(chatRoomid)
        .collection("messages")
        .orderBy("timestamp", descending: false)
        .snapshots();
  }

  // This is for the Recieviing the Message
}
