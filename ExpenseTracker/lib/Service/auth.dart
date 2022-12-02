import 'package:budget_tracker_ui/Model/user.dart';
import 'package:firebase_auth/firebase_auth.dart';


class AuthService{
  registerWithEmailAndPassword(String email, String password) async {
    try {
      final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return credential;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }

  signInWithEmailAndPassword(String email, String password) async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email,
          password: password
      );
      return credential;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
  }
  final FirebaseAuth _auth = FirebaseAuth.instance;
  var person=null;
   Person getPerson(Function f){
  FirebaseAuth.instance.authStateChanges().listen((User user) {
      if (user == null) {
        f.call();
        return null;
        print('User is currently signed out!');
      } else {
        var p=Person(uid: user.uid);
        person=p;
        print('User is signed in!');
        f.call();
        return p;
      }
    });
  }

  void logout(Function callback) async{
    await FirebaseAuth.instance.signOut();
     callback.call();
  }



}