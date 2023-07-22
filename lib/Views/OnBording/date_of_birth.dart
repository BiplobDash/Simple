import 'package:better_half/Provider/screenProvider.dart';
import 'package:better_half/Widgets/custom_button.dart';
import 'package:better_half/const/app_color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class BirthDayScreen extends StatelessWidget {
  String gender;
  String fname;
  String lname;
  BirthDayScreen(
      {required this.gender, required this.fname, required this.lname});

  @override
  Widget build(BuildContext context) {
    final dateProvider = Provider.of<BirthDateProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(15),
              child: Align(
                alignment: Alignment.center,
                child: Container(
                  child: Image.asset('assets/images/dob.png'),
                ),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Text(
                'When was your',
                style: GoogleFonts.poppins(
                    fontSize: 22,
                    fontWeight: FontWeight.w700,
                    color: AppColor.black),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Text(
                'Date of Birth',
                style: GoogleFonts.poppins(
                    fontSize: 22,
                    fontWeight: FontWeight.w700,
                    color: AppColor.primaryColor),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            Center(child:
                Consumer<BirthDateProvider>(builder: (context, provider, _) {
              return CupertinoButton(
                  child: Text(
                      '${provider.selectedDate.month} - ${provider.selectedDate.day} - ${provider.selectedDate.year}'),
                  onPressed: () {
                    showCupertinoModalPopup(
                        context: context,
                        builder: (BuildContext context) => SizedBox(
                            height: 250,
                            child: CupertinoDatePicker(
                              backgroundColor: Colors.white,
                              initialDateTime: provider.date,
                              onDateTimeChanged: (DateTime newTime) {
                                provider.updateDate(newTime);
                              },
                              use24hFormat: true,
                              mode: CupertinoDatePickerMode.date,
                            )));
                  });
            })),
            const SizedBox(
              height: 100,
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: SizedBox(
                  width: 350,
                  height: 50,
                  child: CustomButton('Continue', () {})),
            )
          ],
        ),
      )),
    );
  }
}
