import 'package:better_half/Views/OnBording/gender.dart';
import 'package:better_half/Widgets/custom_button.dart';
import 'package:better_half/const/app_color.dart';
import 'package:better_half/const/app_string.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CreateProfile extends StatelessWidget {
  const CreateProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: true,
        elevation: 0,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.black,
            )),
        actions: [
          TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text(
                "Skip Now",
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ))
        ],
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(15),
              child: Align(
                alignment: Alignment.center,
                child: Container(
                  child: Image.asset('assets/images/profile.png'),
                ),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Text(
                'Let’s create',
                style: GoogleFonts.poppins(
                    fontSize: 22,
                    fontWeight: FontWeight.w700,
                    color: AppColor.black),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Text(
                'Your Profile?',
                style: GoogleFonts.poppins(
                    fontSize: 22,
                    fontWeight: FontWeight.w700,
                    color: AppColor.primaryColor),
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Text(
                AppString.profileText,
                style:
                    GoogleFonts.poppins(fontSize: 14, color: Color(0xFF595567)),
              ),
            ),
            const SizedBox(
              height: 110,
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: SizedBox(
                  width: 350,
                  height: 50,
                  child: CustomButton('Complete Profile', () {
                    Navigator.push(context, CupertinoPageRoute(builder: (_) => Gender()));
                  })),
            )
          ],
        ),
      )),
    );
  }
}
