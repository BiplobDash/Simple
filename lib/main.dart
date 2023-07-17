import 'package:better_half/Provider/Authentication/authProvider.dart';
import 'package:better_half/Provider/screenProvider.dart';
import 'package:better_half/Views/SignUp/signIn.dart';
import 'package:better_half/const/app_string.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_)=> CheckboxProvider()),
    ChangeNotifierProvider(create: (_)=> AuthProvider()),
  ],child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppString.appName,
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.light,
      home: SignIn(),
    );
  }
}