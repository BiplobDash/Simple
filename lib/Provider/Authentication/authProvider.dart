import 'dart:convert';
import 'package:better_half/Views/SignUp/signIn.dart';
import 'package:better_half/Views/SignUp/signUpVerification.dart';
import 'package:better_half/style/appStyle.dart';
import 'package:flutter/cupertino.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:dartz/dartz.dart';

class AuthProvider extends ChangeNotifier {
  // User Signup
  Future<Either<String, Unit>> UserSignUp(
      userName, email, phone, password, context) async {
    final box = GetStorage();
    String emailVerify = email;
    var url = Uri.parse("http://10.0.2.2:8000/app_api/register_user/");
    final headers = {
      'Content-Type': 'application/json',
    };
    final body = {
      'username': userName,
      'email': email,
      'password': password,
      'phone_number': phone,
    };

    try {
      final response =
          await http.post(url, headers: headers, body: jsonEncode(body));

      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body);
        if (jsonData['status'] == 200) {
          Map<String, dynamic> userdata = {
            'email': emailVerify,
          };
          box.write('user', userdata);
          Navigator.push(context,
              CupertinoPageRoute(builder: (_) => SignUpVerification()));
          return right(unit);
        } else {
          final errorData = jsonData['error'];
          return left(errorData);
        }
      } else {
        final errorMessage =
            'Failed to sign up. Status code: ${response.statusCode}';
        return left(errorMessage);
      }
    } catch (e) {
      final errorMessage = 'An error occurred: $e';
      return left(errorMessage);
    }
  }

  // Signup Verify Verification
  Future<Either<String, Unit>> UserSignupVerification(
      num1, num2, num3, num4, num5, context) async {
    final box = GetStorage();
    var value = box.read('user');
    String email = value['email'];
    String verify = num1 + num2 + num3 + num4 + num5;

    var url =
        Uri.parse("http://10.0.2.2:8000/app_api/verify_verification_code/");
    final headers = {
      'Content-Type': 'application/json',
    };
    final body = {
      'email': email,
      'verification_code': verify,
    };
    try {
      final response =
          await http.post(url, headers: headers, body: jsonEncode(body));

      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body);
        if (jsonData['status'] == 200) {
          final token = jsonData['token'];
          box.write('token', token);
          Navigator.push(context, CupertinoPageRoute(builder: (_) => SignIn()));
          return right(unit);
        } else {
          final errorData = jsonData['error'];
          return left(errorData);
        }
      } else {
        final errorMessage =
            'Failed to sign up. Status code: ${response.statusCode}';
        return left(errorMessage);
      }
    } catch (e) {
      final errorMessage = 'An error occurred: $e';
      return left(errorMessage);
    }
  }

  // User Signin
  Future<Either<String, Unit>> UserSignIn(email, password, context) async {
    final box = GetStorage();
    String emailVerify = email;
    var url = Uri.parse("http://10.0.2.2:8000/app_api/login_user/");
    final headers = {
      'Content-Type': 'application/json',
    };
    final body = {
      'email': email,
      'password': password,
    };
    try {
      final response =
          await http.post(url, headers: headers, body: jsonEncode(body));

      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body);
        if (jsonData['status'] == 200) {
          Navigator.push(context,
              CupertinoPageRoute(builder: (_) => SignUpVerification()));
          return right(unit);
        } else {
          final errorData = jsonData['error'];
          return left(errorData);
        }
      } else {
        final errorMessage =
            'Failed to sign up. Status code: ${response.statusCode}';
        return left(errorMessage);
      }
    } catch (e) {
      final errorMessage = 'An error occurred: $e';
      return left(errorMessage);
    }
  }
}
