import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:instagram_pro/prsentation/widgets/body_view.dart';
import 'firestore_service.dart';

class AuthService {
  FirebaseAuth auth = FirebaseAuth.instance;
  final firestoreService = FirestoreService();
  Future<void> createUser(Map<String, dynamic> data, context) async {
    var createAt = DateTime.now().millisecond;
    try {
      final credential = await auth.createUserWithEmailAndPassword(
        email: data['email'],
        password: data['password'],
      );
      var userData = {
        "id": credential.user!.uid,
        "create": createAt,
        "bio": "Bio",
        "des": "using instagram App",
        "url": "google.com",
        "profileUrl":
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRj9JJJAhrJ_MiURbIWctw36JR8warm7xL9rg&usqp=CAU"
      };
      var userDetails = {...data, ...userData};

      await firestoreService.addUser(userDetails);
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: ((context) => BodyView())));
    } catch (e) {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text("Sign Up Failed"),
              content: Text(e.toString()),
            );
          });
    }
  }

  Future<void> loginUser(data, context) async {
    try {
      final credential = await auth.signInWithEmailAndPassword(
        email: data['email'],
        password: data['password'],
      );
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: ((context) => BodyView())));
    } catch (e) {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text("Login Failed"),
              content: Text(e.toString()),
            );
          });
    }
  }
}
