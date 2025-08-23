import 'package:cloud_firestore/cloud_firestore.dart';

// Our Class Message Will have the Follwoing Attributes
/*
Sender Id 
Sender Email
Reciever ID 
Message 
TimeStamp 
*/

class Message {
  // These Are the Attributes of the Message Class
  final String senderId;
  final String senderEmail;
  final String receiverId;
  final String message;
  final Timestamp timestamp;
  // Constructor for the Message Class

  const Message({
    required this.senderId,
    required this.senderEmail,
    required this.receiverId,
    required this.message,
    required this.timestamp,
  });
  // Converting to the Map for the Firebase Firestore
  /*
  We make the Map in the toMap() method because Cloud Firestore (and most NoSQL databases) store documents as key–value pairs (similar to a JSON object).
  */
  // This Will make the Access if the Things Be Easy

  Map<String, dynamic> toMap() {
    return {
      'senderId': senderId,
      'senderEmail': senderEmail,
      'receiverId': receiverId,
      'message': message,
      'timestamp': timestamp,
    };
  }
}
