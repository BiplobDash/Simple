import 'package:better_half/Provider/Authentication/authProvider.dart';
import 'package:better_half/Widgets/custom_button.dart';
import 'package:better_half/const/app_color.dart';
import 'package:better_half/const/app_string.dart';
import 'package:better_half/style/appStyle.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SignUpVerification extends StatelessWidget {
  TextEditingController _num1 = TextEditingController();
  TextEditingController _num2 = TextEditingController();
  TextEditingController _num3 = TextEditingController();
  TextEditingController _num4 = TextEditingController();
  TextEditingController _num5 = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.white),
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
                        controller: _num1,
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
                        controller: _num2,
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
                        controller: _num3,
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
                        controller: _num4,
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
                        controller: _num5,
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
                  child:
                      TextButton(onPressed: () {}, child: Text('Resend Code')),
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
                    child: CustomButton('Verify', () async {
                      final result = await authProvider.UserSignupVerification(
                          _num1.text,
                          _num2.text,
                          _num3.text,
                          _num4.text,
                          _num5.text,
                          context);
                      result.fold((error) {
                        AppStyle().failedAlert(context, error);
                      }, (success) {
                        AppStyle().successAlert(context, success);
                      });
                    })),
              )
            ],
          ),
        ),
      )),
    );
  }
}
