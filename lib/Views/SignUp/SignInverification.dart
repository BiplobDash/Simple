import 'package:better_half/Views/SignUp/forgot.dart';
import 'package:better_half/Widgets/custom_button.dart';
import 'package:better_half/const/app_color.dart';
import 'package:better_half/const/app_string.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class SignInVerification extends StatelessWidget {
  TextEditingController _number1 = TextEditingController();
  TextEditingController _number2 = TextEditingController();
  TextEditingController _number3 = TextEditingController();
  TextEditingController _number4 = TextEditingController();
  TextEditingController _number5 = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        automaticallyImplyLeading: true,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.black,
            )),
      ),
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
                    child: Image.asset('assets/images/verification.png'),
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
                  'Verification Code?',
                  style: GoogleFonts.poppins(
                      fontSize: 22,
                      fontWeight: FontWeight.w700,
                      color: AppColor.primaryColor),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 48,
                      width: 50,
                      color: AppColor.stroke,
                      child: TextField(
                        keyboardType: TextInputType.number,
                        textAlign: TextAlign.center,
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(1),
                          FilteringTextInputFormatter.digitsOnly,
                        ],
                      ),
                    ),
                    Container(
                      height: 48,
                      width: 50,
                      color: AppColor.stroke,
                      child: TextField(
                        keyboardType: TextInputType.number,
                        textAlign: TextAlign.center,
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(1),
                          FilteringTextInputFormatter.digitsOnly,
                        ],
                      ),
                    ),
                    Container(
                      height: 48,
                      width: 50,
                      color: AppColor.stroke,
                      child: TextField(
                        keyboardType: TextInputType.number,
                        textAlign: TextAlign.center,
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(1),
                          FilteringTextInputFormatter.digitsOnly,
                        ],
                      ),
                    ),
                    Container(
                      height: 48,
                      width: 50,
                      color: AppColor.stroke,
                      child: TextField(
                        keyboardType: TextInputType.number,
                        textAlign: TextAlign.center,
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(1),
                          FilteringTextInputFormatter.digitsOnly,
                        ],
                      ),
                    ),
                    Container(
                      height: 48,
                      width: 50,
                      color: AppColor.stroke,
                      child: TextField(
                        keyboardType: TextInputType.number,
                        textAlign: TextAlign.center,
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(1),
                          FilteringTextInputFormatter.digitsOnly,
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15),
                child: Text(
                  AppString.verifyText,
                  style: GoogleFonts.poppins(
                      fontSize: 14, fontWeight: FontWeight.w400),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15),
                child: Container(
                  width: 350,
                  height: 50,
                  decoration: BoxDecoration(border: Border.all()),
                  child: TextButton(
                      onPressed: () {}, child: const Text('Resend Code')),
                ),
              ),
              const SizedBox(
                height: 60,
              ),
              Padding(
                padding: const EdgeInsets.all(15),
                child: SizedBox(
                    width: 350,
                    height: 50,
                    child: CustomButton('Verify', () {
                      Navigator.push(context,
                          CupertinoPageRoute(builder: (_) => Forgot()));
                    })),
              )
            ],
          ),
        ),
      )),
    );
  }
}
