import 'package:better_half/Views/SignUp/SignInverification.dart';
import 'package:better_half/Widgets/custom_button.dart';
import 'package:better_half/Widgets/custom_text.dart';
import 'package:better_half/const/app_color.dart';
import 'package:better_half/const/app_string.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Reset extends StatelessWidget {

  TextEditingController _confirmController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 50,
              ),
              Padding(
                padding: const EdgeInsets.all(15),
                child: Align(
                  alignment: Alignment.center,
                  child: Container(
                    child: Image.asset('assets/images/forgot.png'),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Text(
                  'Enter Your',
                  style: GoogleFonts.poppins(
                      fontSize: 22,
                      fontWeight: FontWeight.w700,
                      color: AppColor.black),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Text(
                  'Email/Phone',
                  style: GoogleFonts.poppins(
                      fontSize: 22,
                      fontWeight: FontWeight.w700,
                      color: AppColor.primaryColor),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15),
                child: Text(
                  AppString.restText,
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: AppColor.dark,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15),
                child: customFormField(TextInputType.text, _confirmController,
                    context, 'Email or phone', (val) {
                  if (val.isEmpty) {
                    return "This field not empty";
                  }
                }),
              ),
              Padding(
                padding: const EdgeInsets.all(15),
                child: SizedBox(
                    width: 350,
                    height: 50,
                    child: CustomButton('Reset Password', () {
                      Navigator.push(context,
                          CupertinoPageRoute(builder: (_) => SignInVerification()));
                    })),
              )
            ],
          ),
        ),
      )),
    );
  }
}
