import 'package:better_half/Provider/Authentication/authProvider.dart';
import 'package:better_half/Provider/postProvider.dart';
import 'package:better_half/Provider/screenProvider.dart';
import 'package:better_half/Route/route_names.dart';
import 'package:better_half/Route/routes.dart';
import 'package:better_half/Views/OnBording/createProfile.dart';
import 'package:better_half/const/app_string.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_)=> CheckboxProvider()),
    ChangeNotifierProvider(create: (_)=> AuthProvider()),
    ChangeNotifierProvider(create: (_)=> postProvider()),
    ChangeNotifierProvider(create: (_) => OptionsProvider())
  ],child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: AppString.appName,
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.light,
      initialRoute: RouteName.profile,
      onGenerateRoute: Routes.generateRoute,
    );
  }
}