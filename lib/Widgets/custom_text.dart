import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget customFormField(
  keyboardtype,
  controller,
  context,
  hinttext,
  validator, {
  bool obscureText = false,
  suffixIcon,
  readOnly = false,
}) {
  return TextFormField(
    keyboardType: keyboardtype,
    readOnly: readOnly,
    style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w400),
    controller: controller,
    obscureText: obscureText,
    textInputAction: TextInputAction.next,
    validator: validator,
    decoration: InputDecoration(
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide.none),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Color(0xFFF3F2F8),
            ),
            borderRadius: BorderRadius.circular(8)),
        suffixIcon: Padding(
          padding: EdgeInsets.all(5),
          child: Container(
            width: 40,
            child: Icon(
              suffixIcon,
              color: Color(0xFF717171),
            ),
          ),
        ),
        fillColor: Color(0xFFF3F2F8),
        filled: true,
        hintText: hinttext,
        hintStyle: TextStyle(
            fontSize: 14, fontWeight: FontWeight.w400, fontFamily: 'P2')),
  );
}

Widget CustomTextField(keyboardtype, controller, context, labeltext) {
  return TextField(
     keyboardType: keyboardtype,
    controller: controller,
    textInputAction: TextInputAction.next,
    decoration: InputDecoration(
      labelText: labeltext,
      
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide.none),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Color(0xFFF3F2F8),
            ),
            borderRadius: BorderRadius.circular(8)),),
    maxLength: 200,
  );
}
