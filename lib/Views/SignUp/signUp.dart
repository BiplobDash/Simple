import 'package:better_half/Provider/Authentication/authProvider.dart';
import 'package:better_half/Provider/screenProvider.dart';
import 'package:better_half/Views/SignUp/signIn.dart';
import 'package:better_half/Views/SignUp/signUpVerification.dart';
import 'package:better_half/Widgets/custom_text.dart';
import 'package:better_half/const/app_color.dart';
import 'package:better_half/const/app_string.dart';
import 'package:better_half/style/appStyle.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../../widgets/custom_button.dart';

class SignUp extends StatelessWidget {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    CheckboxProvider checkboxProvider = Provider.of<CheckboxProvider>(context);
    AuthProvider authProvider = Provider.of<AuthProvider>(context);

    return Scaffold(
      backgroundColor: const Color(0xFFF3F2F8),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            Expanded(
                child: Container(
              decoration: const BoxDecoration(
                  color: Color(0xFFFDFDFD),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20))),
              child: Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: SingleChildScrollView(
                  child: Form(
                    key: _formKey,
                    autovalidateMode: AutovalidateMode.always,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 300),
                          child: IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.close,
                                weight: 24,
                              )),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 70),
                          child: Image.asset(
                            'assets/images/Bettter Half.png',
                            width: 175,
                            height: 39,
                          ),
                        ),
                        Text(
                          AppString.signup1,
                          style: GoogleFonts.poppins(
                              fontSize: 22,
                              color: Colors.black,
                              fontWeight: FontWeight.w400),
                        ),
                        Text(
                          AppString.signup2,
                          style: GoogleFonts.poppins(
                              fontSize: 22,
                              color: AppColor.primaryColor,
                              fontWeight: FontWeight.w700),
                        ),
                        customFormField(TextInputType.text, _nameController,
                            context, "Username", (val) {
                          if (val.isEmpty) {
                            // ignore: unnecessary_string_escapes
                            return "this field can\'t be empty";
                          }
                          return null;
                        }, suffixIcon: Icons.person),
                        const SizedBox(
                          height: 5,
                        ),
                        customFormField(TextInputType.number, _phoneController,
                            context, "Phone", (val) {
                          if (val.isEmpty) {
                            // ignore: unnecessary_string_escapes
                            return "this field can\'t be empty";
                          }
                          return null;
                        }, suffixIcon: Icons.phone),
                        const SizedBox(
                          height: 5,
                        ),
                        customFormField(TextInputType.text, _emailController,
                            context, "Email", (val) {
                          if (val.isEmpty) {
                            return "this field can\'t be empty";
                          }
                          if (!val.contains(RegExp(r'\@'))) {
                            return "enter a valid email address";
                          }
                          return null;
                        }, suffixIcon: Icons.email),
                        const SizedBox(
                          height: 5,
                        ),
                        customFormField(TextInputType.text, _passwordController,
                            context, "Password", (val) {
                          if (val.isEmpty) {
                            return "this field can\'t be empty";
                          }
                          return null;
                        }, suffixIcon: Icons.remove_red_eye_outlined),
                        Row(
                          children: [
                            Checkbox(
                              value: checkboxProvider.isChecked,
                              onChanged: (bool? newValue) {
                                checkboxProvider.toggleCheckbox(newValue);
                              },
                            ),
                            Text(
                              AppString.signup3,
                              style: GoogleFonts.poppins(
                                  fontSize: 12, fontWeight: FontWeight.w400),
                            )
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 10, right: 10, bottom: 8, top: 5),
                          child: SizedBox(
                              width: 350,
                              height: 50,
                              child: CustomButton("Sign Up", () async {
                                if (_formKey.currentState!.validate() &&
                                    checkboxProvider.isChecked == true) {
                                  final result = await authProvider.UserSignUp(
                                      _nameController.text,
                                      _emailController.text,
                                      _phoneController.text,
                                      _passwordController.text,
                                      context);
                                  result.fold(
                                    (error) {
                                      AppStyle().failedAlert(context, error);
                                    },
                                    (success) {
                                      AppStyle().successAlert(context, success);
                                    },
                                  );
                                }
                              })),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10, right: 10),
                          child: Row(
                            children: [
                              Container(
                                width: 151,
                                height: 56,
                                color: AppColor.stroke,
                                child: InkWell(
                                  onTap: () {},
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 30),
                                    child: Row(
                                      children: [
                                        Image.asset(
                                          'assets/icons/facebook.png',
                                          width: 24,
                                          height: 24,
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 15),
                                          child: Text(
                                            'Sign up',
                                            style: GoogleFonts.poppins(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w500),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 17),
                                child: Container(
                                  width: 151,
                                  height: 56,
                                  color: AppColor.stroke,
                                  child: InkWell(
                                    onTap: () {},
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 30),
                                      child: Row(
                                        children: [
                                          Image.asset(
                                            'assets/icons/google.png',
                                            width: 24,
                                            height: 24,
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(left: 15),
                                            child: Text(
                                              'Sign up',
                                              style: GoogleFonts.poppins(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 50, right: 15),
                          child: Row(
                            children: [
                              Text(
                                'Already have an account?',
                                style: GoogleFonts.poppins(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: AppColor.dark,
                                ),
                              ),
                              Align(
                                alignment: Alignment.centerRight,
                                child: TextButton(
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          CupertinoPageRoute(
                                              builder: (_) => SignIn()));
                                    },
                                    child: Text(
                                      'Sign in',
                                      style: GoogleFonts.poppins(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                        color: AppColor.primaryColor,
                                      ),
                                    )),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            )),
          ],
        ),
      ),
    );
  }
}
