import 'package:better_half/Route/route_names.dart';
import 'package:better_half/Views/OnBording/createProfile.dart';
import 'package:better_half/Views/OnBording/gender.dart';
import 'package:better_half/Views/SignUp/signIn.dart';
import 'package:flutter/material.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteName.profile:
        return MaterialPageRoute(
            builder: (BuildContext context) => const CreateProfile());
      case RouteName.gender:
        return MaterialPageRoute(
            builder: (BuildContext context) => const Gender());
      default:
        return MaterialPageRoute(builder: (_) {
          return const Scaffold(
            body: Center(
              child: Text('No Route Defined'),
            ),
          );
        });
    }
  }
}
