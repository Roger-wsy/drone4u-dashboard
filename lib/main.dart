import 'package:drone4u_dashboard/constants.dart';
import 'package:drone4u_dashboard/screens/main/dashboard_screen.dart';
import 'package:drone4u_dashboard/screens/main/main_screen.dart';
import 'package:drone4u_dashboard/screens/settings_screen/d4u_setting.dart';
import 'package:drone4u_dashboard/screens/settings_screen/d4u_setting_screen.dart';
import 'package:drone4u_dashboard/screens/welcome/d4u_welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:google_fonts/google_fonts.dart';

final navigatorKey = GlobalKey<NavigatorState>();
Future<void> main() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Admin Panel',
      theme: ThemeData.dark().copyWith(
        primaryColor: d4uPrimaryColor,
        scaffoldBackgroundColor: bgColor,
        textTheme: GoogleFonts.poppinsTextTheme(
          Theme.of(context).textTheme,
        ),
        canvasColor: d4uSecondaryColor,
      ),
      home: const D4uWelcomeScreen(),
      navigatorKey: navigatorKey,
      routes: {
        // When navigating to the "/" route, build the FirstScreen widget.
        '/dashboard': (context) => const DashboardScreen(),
        // When navigating to the "/second" route, build the SecondScreen widget.
        '/welcome': (context) => const D4uWelcomeScreen(),
      },
    );
  }
}
