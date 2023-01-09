import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:treely/config/color_pallet.dart';

import 'routes/routes.gr.dart';

int? initScreen;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  initScreen = await prefs.getInt("initScreen");
  initScreen ?? await prefs.setInt("initScreen", 1);
  print('initScreen ${initScreen}');
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final _appRouter = AppRouter();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Treely',
      theme: ThemeData(
        scaffoldBackgroundColor: kTertiaryColor,
        primarySwatch: Colors.green,
        textTheme: GoogleFonts.arapeyTextTheme(),
      ),
      routerDelegate: _appRouter.delegate(initialRoutes: [
        const OnboardingScreen()
      ]),
      routeInformationParser: _appRouter.defaultRouteParser(),
    );
  }
}
