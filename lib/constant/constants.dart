import 'package:flutter/material.dart';

class Constants {
  Color Kprimecolor = Color(0xff272727);
  Color Ksecondcolor = Color(0xff191919);
  Color Kwightcolor = Colors.white;
  Color Kyellocolor = Color.fromARGB(255, 244, 215, 99);
}

Constants color = Constants();
textFormFiledDecration(String text, Icon icon) {
  return InputDecoration(
      labelStyle: TextStyle(color: color.Kwightcolor),
      enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: color.Kyellocolor),
          borderRadius: BorderRadius.circular(10)),
      focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: color.Kyellocolor),
          borderRadius: BorderRadius.circular(10)),
      label: Text(text),
      prefixIcon: icon,
      iconColor: color.Kyellocolor);
}
