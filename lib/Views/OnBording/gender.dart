import 'package:better_half/Provider/screenProvider.dart';
import 'package:better_half/Widgets/custom_button.dart';
import 'package:better_half/const/app_color.dart';
import 'package:better_half/const/app_string.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class Gender extends StatelessWidget {
  const Gender({super.key});

  @override
  Widget build(BuildContext context) {
    final optionProvider = Provider.of<OptionsProvider>(context);

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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 50,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Text(
                'What’s your',
                style: GoogleFonts.poppins(
                    fontSize: 22,
                    fontWeight: FontWeight.w700,
                    color: AppColor.black),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Text(
                'Gender',
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
                  Image.asset(
                    'assets/images/Male.png',
                    width: 155,
                    height: 150,
                  ),
                  Image.asset('assets/images/Female.png',
                      width: 155, height: 150),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                      child: RadioListTile(
                    title: Text('Male'),
                    value: optionProvider.options[0],
                    groupValue: optionProvider.currentOption,
                    onChanged: (value) {
                      optionProvider.updateCurrentOption(value.toString());
                    },
                  )),
                  Expanded(
                    child: RadioListTile(
                          title: Text('Female'),
                          value: optionProvider.options[1],
                          groupValue: optionProvider.currentOption,
                          onChanged: (value) {
                            optionProvider.updateCurrentOption(value.toString());
                          },
                        )),
                ],
              ),
            ),
            const SizedBox(
              height: 130,
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: SizedBox(
                  width: 350,
                  height: 50,
                  child: CustomButton('Continue', () {
                    
                  })),
            )
          ],
        ),
      )),
    );
  }
}
