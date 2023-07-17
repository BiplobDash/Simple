import 'package:flutter/material.dart';
import 'package:quickalert/quickalert.dart';

class AppStyle {
  // loading

  progressDialog(context) {
    showDialog(
        context: context,
        builder: (_) {
          return Dialog(
            elevation: 0,
            backgroundColor: Colors.transparent,
            child: Image.asset('assets/icons/loading.gif'),
          );
        });
  }

  // Failed Snackbar
   void failedAlert(context, text) {
    QuickAlert.show(
        context: context,
        text: text,
        type: QuickAlertType.warning);
  }

  // Sucess Snackbar
  void successAlert(context, text) {
    QuickAlert.show(
        context: context,
        text: text,
        type: QuickAlertType.success);
  }
}
