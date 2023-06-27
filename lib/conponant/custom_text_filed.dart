import 'package:flutter/material.dart';
import 'package:flutter_app_note/constant/constants.dart';
import 'package:flutter_app_note/constant/constants.dart';

class CustoMTextFormFiled extends StatelessWidget {
  CustoMTextFormFiled({
    required this.contraller,
    this.obsecure = false,
    required this.text,
    required this.icon,
    required this.valdation,
    required this.filedDecoration,
  });
  final TextEditingController? contraller;
  final String? text;
  final Icon? icon;
  bool obsecure;
  final Function(String value) valdation;
  final Function() filedDecoration;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: TextStyle(color: color.Kwightcolor),
      validator: (value) {
        valdation(value!);
      },
      controller: contraller,
      keyboardType: TextInputType.emailAddress,
      cursorHeight: 25,
      autovalidateMode: AutovalidateMode.disabled,
      decoration: textFormFiledDecration(text!, icon!),
      obscureText: obsecure,
    );
  }
}
