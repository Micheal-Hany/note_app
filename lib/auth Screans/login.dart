import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_note/conponant/alert.dart';
import 'package:flutter_app_note/conponant/custom_text_filed.dart';
import 'package:flutter_app_note/constant/constants.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  GlobalKey<FormState> formstate = new GlobalKey<FormState>();

  final emailContraller = TextEditingController();
  final passwordContraller = TextEditingController();

  signin() async {
    var formdata = formstate.currentState;
    if (formdata!.validate()) {
      formdata.save();
      try {
        showloading(context, "Please Wait");
        UserCredential userCredential = await FirebaseAuth.instance
            .signInWithEmailAndPassword(
                email: emailContraller.text, password: passwordContraller.text);
        return userCredential;
      } on FirebaseAuthException catch (e) {
        if (e.code == 'user-not-found') {
          Navigator.of(context).pop();
          showErrorAwesomeDialog(context, 'No user found for that email.');
        } else if (e.code == 'wrong-password') {
          Navigator.of(context).pop();
          showErrorAwesomeDialog(
              context, 'Wrong password provided for that user.');
        }
      }
    } else {
      showErrorAwesomeDialog(context, "Log in Filed!!");
    }
  }

  @override
  Widget build(BuildContext context) {
    Constants color = Constants();
    return Scaffold(
        backgroundColor: color.Kprimecolor,
        body: ListView(
          padding: EdgeInsets.all(10),
          children: [
            SizedBox(
              height: 100,
            ),
            Center(
                child: Container(
              padding: EdgeInsets.only(bottom: 50),
              child: Text(
                "Login",
                style: TextStyle(
                    color: color.Kyellocolor, fontSize: 30, letterSpacing: 1.4),
              ),
            )),
            Form(
                key: formstate,
                child: Column(
                  children: [
                    CustoMTextFormFiled(
                      contraller: emailContraller,
                      filedDecoration: () {
                        textFormFiledDecration(
                            'Email',
                            Icon(
                              Icons.person,
                              color: color.Kyellocolor,
                            ));
                      },
                      text: 'Email',
                      icon: Icon(Icons.person, color: color.Kyellocolor),
                      valdation: (text) {
                        if (text!.length <= 4) {
                          return 'Name Should Be more than 4 char';
                        } else if (text.length >= 4) {
                          for (int i = 0; i <= text.length; i++) {
                            if (!text.contains('@gmail.com')) {
                              return 'Email Should have a @gmail.com';
                            }
                          }
                        } else
                          return null;
                      },
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    CustoMTextFormFiled(
                      obsecure: true,
                      filedDecoration: () {
                        textFormFiledDecration('Password', Icon(Icons.person));
                      },
                      contraller: passwordContraller,
                      text: 'Password',
                      icon: Icon(Icons.person, color: color.Kyellocolor),
                      valdation: (value) {
                        if (value.isEmpty) {
                          return 'Please Enter your password';
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'If you don\'t have account  ',
                          style: TextStyle(color: color.Kwightcolor),
                        ),
                        InkWell(
                            onTap: () =>
                                {Navigator.of(context).pushNamed("signup")},
                            child: Text(
                              'Click Here',
                              style: TextStyle(color: color.Kyellocolor),
                            ))
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        var user = await signin();

                        if (user != null) {
                          Navigator.of(context)
                              .pushReplacementNamed("HomePage");
                        }
                      },
                      child: Text(
                        'log in',
                        style:
                            TextStyle(fontSize: 18, color: color.Kprimecolor),
                      ),
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStatePropertyAll(color.Kyellocolor),
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        )),
                      ),
                    ),
                  ],
                ))
          ],
        ));
  }
}
