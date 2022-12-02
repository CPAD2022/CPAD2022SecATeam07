import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Model/user.dart';
import 'Service/auth.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(name: 'com.example.budget_tracker_ui',
      options: FirebaseOptions(
            apiKey: "AIzaSyBnzTFgFn9qkKDB5tqHYUfHxFGCDUXH95s",
            authDomain: "budgettracker2-76944.firebaseapp.com",
            projectId: "budgettracker2-76944",
            storageBucket: "budgettracker2-76944.appspot.com",
            messagingSenderId: "381708149140",
            appId: "1:381708149140:web:84950a60969b0cdfda6f81",
            measurementId: "G-T6M3WHBB0K"

      )

  );
  var Auth=AuthService();
  Auth.getPerson(()=>{
  runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
  home: Wrapper(Auth.person),
  ))
  });
}