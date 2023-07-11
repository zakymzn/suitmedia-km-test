import 'package:flutter/material.dart';
import 'package:suitmedia_km_test/page1.dart';
import 'package:suitmedia_km_test/page2.dart';
import 'package:suitmedia_km_test/page3.dart';
import 'package:suitmedia_km_test/utility/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: Page1(),
      navigatorObservers: [
        routeObserver,
      ],
      onGenerateRoute: routeSettings(),
      // routes: {
      //   Page1.route: (context) => Page1(),
      //   Page2.route: (context) => Page2(
      //         name: ModalRoute.of(context)?.settings.arguments as String,
      //       ),
      //   Page3.route: (context) => Page3(),
      // },
    );
  }
}
