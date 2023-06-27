import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';

showloading(context, String text) {
  return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Center(child: Text("$text")),
          content: Container(
            height: 50,
            child: Center(child: CircularProgressIndicator()),
          ),
        );
      });
}

showErrorAwesomeDialog(context, String text) {
  AwesomeDialog(
    context: context,
    animType: AnimType.scale,
    dialogType: DialogType.error,
    body: Center(
      child: Text(
        '$text',
        style: TextStyle(fontStyle: FontStyle.italic),
      ),
    ),
    btnOkOnPress: () {},
  )..show();
}

showSuccessAwesomeDialog(context, String text) {
  AwesomeDialog(
    context: context,
    animType: AnimType.scale,
    dialogType: DialogType.success,
    body: Center(
      child: Text(
        '$text',
        style: TextStyle(fontStyle: FontStyle.italic),
      ),
    ),
    btnOkOnPress: () {},
  )..show();
}

showWarinAwesomeDialog(context, String text) {
  AwesomeDialog(
    context: context,
    animType: AnimType.scale,
    dialogType: DialogType.warning,
    body: Center(
      child: Text(
        '$text',
        style: TextStyle(fontStyle: FontStyle.italic),
      ),
    ),
    btnOkOnPress: () {},
  )..show();
}

String getUsernameFromEmail(String email) {
  return email.split('@')[0].replaceAll('.', '');
}
