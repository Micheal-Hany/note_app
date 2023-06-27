import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter_app_note/conponant/alert.dart';
import 'package:flutter_app_note/conponant/custom_text_filed.dart';
import 'package:flutter_app_note/constant/constants.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  bool ispasswordWeak = false;
  bool isInFireBase = false;

  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  GlobalKey<FormState> formstate = new GlobalKey<FormState>();
  signup() async {
    var formdata = formstate.currentState;
    if (formdata!.validate()) {
      //formdata.save();

      //isInFireBase = true;
      try {
        showloading(context, "Please Wait");
        UserCredential userCredential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(
                email: _emailController.text,
                password: _passwordController.text);
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          Navigator.of(context).pop();
          ispasswordWeak = true;
          showWarinAwesomeDialog(context, "The password provided is too weak.");
        } else if (e.code == 'email-already-in-use') {
          Navigator.of(context).pop();
          showWarinAwesomeDialog(
              context, 'The account already exists for that email.');
        }
      } catch (e) {
        print(e);
      }
    } else {
      showErrorAwesomeDialog(context, "Sign Up Filed!!");
    }
  }

  @override
  Widget build(BuildContext context) {
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
                "Register",
                style: TextStyle(
                    color: color.Kyellocolor, fontSize: 30, letterSpacing: 1.4),
              ),
            )),
            Form(
                key: formstate,
                child: Column(
                  children: [
                    CustoMTextFormFiled(
                      filedDecoration: () {
                        textFormFiledDecration(
                            'Username',
                            Icon(
                              Icons.person_3_outlined,
                            ));
                      },
                      contraller: _nameController,
                      text: 'Username',
                      icon: Icon(Icons.person_3_outlined,
                          color: color.Kyellocolor),
                      valdation: (value) {
                        if (value!.length > 100) {
                          return "Username must be less thann 100 char";
                        } else if (value.length < 2) {
                          return "Username must be longger than 2 char";
                        }
                      },
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    CustoMTextFormFiled(
                      filedDecoration: () {
                        textFormFiledDecration(
                            'Email', Icon(Icons.email_outlined));
                      },
                      contraller: _emailController,
                      icon:
                          Icon(Icons.email_outlined, color: color.Kyellocolor),
                      text: 'Email',
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
                        textFormFiledDecration(
                            'Password', Icon(Icons.password_sharp));
                      },
                      contraller: _passwordController,
                      text: 'Password',
                      icon:
                          Icon(Icons.password_sharp, color: color.Kyellocolor),
                      valdation: (value) {
                        if (value!.isEmpty) {
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
                        Text('If you have account  ',
                            style: TextStyle(color: color.Kwightcolor)),
                        InkWell(
                            onTap: () =>
                                {Navigator.of(context).pushNamed("login")},
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
                        await signup();

                        showSuccessAwesomeDialog(context, 'Congratulations!');
                        Navigator.of(context).pushReplacementNamed("HomePage");
                        _nameController.clear();
                        _emailController.clear();
                        _passwordController.clear();
                      },
                      child: Text(
                        'Sign Up',
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
