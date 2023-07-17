import 'package:better_half/const/app_color.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget CustomButton(String title, onpressd) {
  return ElevatedButton(
    onPressed: onpressd, 
    child: Text(title, style: GoogleFonts.poppins(
      fontSize: 16,
    ),),
    style: ElevatedButton.styleFrom(
      backgroundColor: AppColor.primaryColor,
      foregroundColor: Colors.white,
      textStyle: TextStyle(
        fontSize: 16,
      )
    ),);
}
