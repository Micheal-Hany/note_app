import 'dart:io';
import 'dart:math';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_app_note/conponant/alert.dart';
import 'package:flutter_app_note/conponant/custom_text_filed.dart';
import 'package:flutter_app_note/constant/constants.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';

class AddNotes extends StatefulWidget {
  const AddNotes({super.key});

  @override
  State<AddNotes> createState() => _AddNotesState();
}

class _AddNotesState extends State<AddNotes> {
  final noteTitleController = TextEditingController();
  final noteDecriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Constants color = Constants();

    return Scaffold(
      backgroundColor: color.Kprimecolor,
      appBar: AppBar(
        backgroundColor: color.Kprimecolor,
        title: Text(
          'Adding Note',
          style: TextStyle(
            fontSize: 23,
          ),
        ),
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
                      textFormFiledDecration(
                          'Note Title', Icon(Icons.note_add_outlined));
                    },
                    contraller: noteTitleController,
                    text: 'Note Title',
                    icon:
                        Icon(Icons.note_add_outlined, color: color.Kyellocolor),
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
                  CustoMTextFormFiled(
                    filedDecoration: () {
                      textFormFiledDecration(
                          'Note description', Icon(Icons.note_add_outlined));
                    },
                    contraller: noteDecriptionController,
                    text: 'Note description',
                    icon:
                        Icon(Icons.note_add_outlined, color: color.Kyellocolor),
                    valdation: (value) {
                      if (value.isEmpty) {
                        return 'Please Enter your Note description';
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      addNoteToFirebase(context);
                    },
                    child: Text(
                      'Add Note',
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

  void addNoteToFirebase(BuildContext context) {
    CollectionReference noteDetails =
        FirebaseFirestore.instance.collection('notes');

    noteDetails.add({
      'title': noteTitleController.text,
      'decription': noteDecriptionController.text,
      'createdAt': DateTime.now(),
     
    });

    CircularNotchedRectangle();
    showSuccessAwesomeDialog(context, 'Note added Sucssefully');

    noteTitleController.clear();
    noteDecriptionController.clear();
  }
}
