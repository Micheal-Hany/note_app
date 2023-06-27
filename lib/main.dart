import 'package:flutter/material.dart';
import 'package:flutter_app_note/auth%20Screans/sighUp.dart';
import 'package:flutter_app_note/card/addNotes.dart';
import 'package:flutter_app_note/firebase_options.dart';
import 'package:flutter_app_note/home/edit_note.dart';

import 'package:flutter_app_note/home/homepage.dart';
import 'auth Screans/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

//import 'firebase_options.dart';
bool? isLogin;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
      );
  var user = FirebaseAuth.instance.currentUser;
  if (user == null) {
    isLogin = false;
    // Navigator.of(context).pushReplacementNamed("HomePage");
  } else
    isLogin = true;
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      darkTheme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      title: 'Notes App',
      routes: {
        "login": (context) => Login(),
        "signup": (context) => Signup(),
        "HomePage": (context) => HomePage(),
        "addnotes": (context) => AddNotes(),
        //  "editNote": (context) => EditNote(),
      },
      home: isLogin == false ? Login() : HomePage(),
    );
  }
}
