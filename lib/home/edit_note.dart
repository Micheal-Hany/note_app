import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_note/conponant/alert.dart';
import 'package:flutter_app_note/conponant/custom_text_filed.dart';
import 'package:flutter_app_note/constant/constants.dart';
import '';
class EditNote extends StatelessWidget {
  EditNote({required this.title, required this.decription, required this.id});
  final String id;
  final String title;
  final String decription;
  final titlecontraller = TextEditingController();
  final decriptionContraller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Constants color = Constants();
    titlecontraller.text = title;
    decriptionContraller.text = decription;
    return Scaffold(
      backgroundColor: color.Kprimecolor,
      appBar: AppBar(
        backgroundColor: color.Kprimecolor,
        title: Text('Edit Note'),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              Form(
                  child: Column(
                children: [
                  SizedBox(
                    height: 30,
                  ),
                  CustoMTextFormFiled(
                    filedDecoration: () {
                      textFormFiledDecration('Edit Title', Icon(Icons.edit));
                    },
                    contraller: titlecontraller,
                    text: 'Edit Title',
                    icon: Icon(Icons.edit, color: color.Kyellocolor),
                    valdation: (value) {
                      if (value.isEmpty) {
                        return 'Please Enter your Note Title';
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 35,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  CustoMTextFormFiled(
                    filedDecoration: () {
                      textFormFiledDecration(
                          'Edit description', Icon(Icons.edit));
                    },
                    contraller: decriptionContraller,
                    text: 'Edit description',
                    icon: Icon(Icons.edit, color: color.Kyellocolor),
                    valdation: (value) {
                      if (value.isEmpty) {
                        return 'Please Enter your Note Title';
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      updateNote(context);
                    },
                    child: Text(
                      'Edit Note',
                      style: TextStyle(fontSize: 18, color: color.Kprimecolor),
                    ),
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStatePropertyAll(color.Kyellocolor),
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      )),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      deleteNote(context);
                    },
                    child: Text(
                      'Delete Note',
                      style: TextStyle(fontSize: 18, color: color.Kprimecolor),
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
              )),
            ],
          ),
        ),
      ),
    );
  }

  void updateNote(BuildContext context) {
    CollectionReference note = FirebaseFirestore.instance.collection('notes');

    note.doc(id).update({
      'title': titlecontraller.text,
      'decription': decriptionContraller.text,
    });

    CircularNotchedRectangle();
    showSuccessAwesomeDialog(context, "Note Updated Sucssefully");
  }

  void deleteNote(BuildContext context) {
    CollectionReference note = FirebaseFirestore.instance.collection('notes');
    note
        .doc(id)
        .delete()
        .then((value) => print("User Deleted"))
        .catchError((error) => print("Failed to delete user: $error"));
    CircularNotchedRectangle();
    showSuccessAwesomeDialog(context, "Note Deleted Sucssefully");
  }
}
