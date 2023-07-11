import 'package:flutter/material.dart';
import 'package:suitmedia_km_test/page1.dart';
import 'package:suitmedia_km_test/page2.dart';
import 'package:suitmedia_km_test/page3.dart';
import 'package:suitmedia_km_test/utility/multi_argument.dart';

final RouteObserver<ModalRoute> routeObserver = RouteObserver<ModalRoute>();

routeSettings() {
  return (RouteSettings settings) {
    switch (settings.name) {
      case Page1.route:
        return MaterialPageRoute(
          builder: (context) => Page1(),
        );
      case Page2.route:
        final args = settings.arguments as MultiArgument;
        return MaterialPageRoute(
          builder: (context) {
            return Page2(
              name: args.arg1,
              selectedUserName: args.arg2,
            );
          },
        );
      case Page3.route:
        final name = settings.arguments as String;
        return MaterialPageRoute(
          builder: (context) {
            return Page3(name: name);
          },
        );
      default:
        return MaterialPageRoute(
          builder: (context) {
            return Scaffold(
              body: Center(
                child: Text('Page not found :('),
              ),
            );
          },
        );
    }
  };
}
