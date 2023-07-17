import 'package:better_half/Widgets/custom_button.dart';
import 'package:better_half/Widgets/custom_text.dart';
import 'package:better_half/const/app_color.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Forgot extends StatelessWidget {
  TextEditingController _password = TextEditingController();
  TextEditingController _confirmPass = TextEditingController();
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
              Padding(
                padding: const EdgeInsets.all(15),
                child: Align(
                  alignment: Alignment.center,
                  child: Container(
                    child: Image.asset('assets/images/code.png'),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Text(
                  'Please add',
                  style: GoogleFonts.poppins(
                      fontSize: 22,
                      fontWeight: FontWeight.w700,
                      color: AppColor.black),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Text(
                  'New Password',
                  style: GoogleFonts.poppins(
                      fontSize: 22,
                      fontWeight: FontWeight.w700,
                      color: AppColor.primaryColor),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15),
                child: customFormField(TextInputType.text, _password, context,
                    "Password", (val) {},
                    suffixIcon: Icons.remove_red_eye_outlined),
              ),
              SizedBox(
                height: 5,
              ),
              Padding(
                padding: const EdgeInsets.all(15),
                child: customFormField(TextInputType.text, _confirmPass,
                    context, "Confirm Password", (val) {},
                    suffixIcon: Icons.remove_red_eye_outlined),
              ),
              SizedBox(
                height: 85,
              ),
              Padding(
                padding: const EdgeInsets.all(15),
                child: SizedBox(
                    width: 350,
                    height: 50,
                    child: CustomButton('Save new Password', () {
                      if (_password.value == _confirmPass.value) {}
                    })),
              )
            ],
          ),
        ),
      )),
    );
  }
}
