import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class authservice {
  //instance of Auth

  final FirebaseAuth _auth = FirebaseAuth.instance;

  //Now We will include Here the Instance of the Fire Store
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Getting the Current  user

  User? getcurrentUser() {
    return _auth.currentUser;
  }

  //Sign in
  Future<UserCredential> signInWithEmailPassword(
    String email,
    String password,
  ) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      // Here We will Do the Major Functionlity for the Storage

      return userCredential;
    } on FirebaseAuthException catch (e) {
      throw Exception(e.message ?? "Login failed. Please try again.");
    }
  }

  // Sign Out
  Future<void> signOut() async {
    // Performing the Sign Out Functionalities here
    return await _auth.signOut();
  }

  //Sign Up
  //
  Future<UserCredential> signUpWithEmailandPassword(
    String email,
    String password,
  ) async {
    try {
      UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);

      // Here We will Do the Major Functionlity for the Storage
      await _firestore.collection("Users").doc(userCredential.user!.uid).set({
        "uid": userCredential.user!.uid,
        "email": email,
      });

      return userCredential;
    }
    //Errors Handling must be  done here
    on FirebaseAuthException catch (e) {
      throw Exception(e.toString());
    }
  }
}
