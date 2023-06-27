import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_note/card/addNotes.dart';
import 'package:flutter_app_note/home/edit_note.dart';
import 'package:flutter_app_note/constant/constants.dart';

class HomePage extends StatefulWidget {
  HomePage({this.userId});
  final String? userId;
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Stream collectionStream =
      FirebaseFirestore.instance.collection('notes').snapshots();

  @override
  Widget build(BuildContext context) {
    Constants color = Constants();
    final Stream<QuerySnapshot> _usersStream = FirebaseFirestore.instance
        .collection('notes')
        .orderBy('createdAt', descending: true)
        .snapshots();
    return Scaffold(
        backgroundColor: color.Kprimecolor,
        appBar: AppBar(
            shadowColor: color.Kprimecolor,
            backgroundColor: color.Kprimecolor,
            title: Text(
              'Notes',
              style: TextStyle(fontSize: 23),
            ),
            actions: [
              IconButton(
                  onPressed: () async {
                    await FirebaseAuth.instance.signOut();
                    Navigator.of(context).pushReplacementNamed("login");
                  },
                  icon: Icon(Icons.exit_to_app_rounded))
            ]),
        floatingActionButton: FloatingActionButton(
          backgroundColor: color.Kyellocolor,
          onPressed: () {
            Navigator.of(context).pushNamed("addnotes");
          },
          child: Icon(
            Icons.add,
            color: color.Kprimecolor,
          ),
        ),
        body: StreamBuilder<QuerySnapshot>(
          stream: _usersStream,
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            try {
              if (snapshot.hasError) {
                return Scaffold(
                  body: Center(
                    child: Text(
                      'Please check your conection',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                );
              }
            } on Exception catch (e) {
              print('Error -------> $e');
            }

            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            }

            return ListView(
              padding: EdgeInsets.only(top: 20),
              children: snapshot.data!.docs.map((DocumentSnapshot document) {
                Map<String, dynamic> data =
                    document.data()! as Map<String, dynamic>;

                return Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    decoration: BoxDecoration(
                        color: color.Kyellocolor,
                        borderRadius: BorderRadius.circular(20)),
                    padding: EdgeInsets.only(
                      top: 20,
                    ),
                    height: 150,
                    child: ListTile(
                      trailing: IconButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => EditNote(
                                        title: data['decription'],
                                        decription: data['title'],
                                        id: document.id,
                                      )));
                        },
                        icon: Icon(Icons.edit),
                      ),
                      title: Text(
                        '${data['title']}',
                        style:
                            TextStyle(fontSize: 23, color: color.Ksecondcolor),
                      ),
                      subtitle: Padding(
                        padding: EdgeInsets.only(top: 15),
                        child: Text(
                          '${data['decription']}',
                          style: TextStyle(
                              fontSize: 20, color: color.Ksecondcolor),
                        ),
                      ),
                    ),
                  ),
                );
              }).toList(),
            );
          },
        ));
  }
}
