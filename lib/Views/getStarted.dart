import 'package:better_half/Views/SignUp/signIn.dart';
import 'package:better_half/Widgets/custom_button.dart';
import 'package:better_half/const/app_color.dart';
import 'package:better_half/const/app_string.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GetStarted extends StatelessWidget {
  const GetStarted({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 374,
              height: 336,
              child: Image.asset('assets/images/pana.png'),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 18, right: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    AppString.start,
                    style: GoogleFonts.poppins(
                        fontSize: 22,
                        color: Colors.black,
                        fontWeight: FontWeight.w700),
                  ),
                  Text(
                    AppString.startTitle,
                    style: GoogleFonts.poppins(
                        fontSize: 22,
                        color: AppColor.primaryColor,
                        fontWeight: FontWeight.w700),
                  ),
                  Text(
                    AppString.startDes,
                    style: GoogleFonts.poppins(
                        fontSize: 14, color: const Color(0xFF595567)),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 100,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: SizedBox(
                  width: 350,
                  height: 50,
                  child: CustomButton("Get Started", () {
                    Navigator.push(context, CupertinoPageRoute(builder: (_) => SignIn()));
                  })),
            ),
          ],
        ),
      )),
    );
  }
}
