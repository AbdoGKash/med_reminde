import 'package:flutter/material.dart';
import 'package:med_reminder/features/add_med/view/add_med.dart';
import 'package:med_reminder/features/home/view/home.dart';
import 'routers_name.dart';

class AppRouter {
  static Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutersName.home:
        return MaterialPageRoute(
          builder: (_) => const Home(),
        );
      case RoutersName.addMed:
        return MaterialPageRoute(
          builder: (_) => AddMedicine(),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Center(
              child: Text("No Route Found"),
            ),
          ),
        );
    }
  }
}
