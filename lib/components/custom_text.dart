import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget CustomTextInput(String hint, TextEditingController controller,
    TextInputType type, bool isobscureText) {
  return Card(
    color: Colors.green[100],
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10.0),
    ),
    child: TextFormField(
      keyboardType: type,
      controller: controller,
      obscureText: isobscureText,
      autofocus: false,
      cursorColor: Colors.green,
      style: GoogleFonts.roboto(fontSize: 20, color: Colors.green),
      decoration: InputDecoration(
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.green),
        ),
        hintText: hint,
        hintStyle: TextStyle(color: Colors.green),
        contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
      ),
    ),
  );
}
