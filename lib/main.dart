import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:treely/config/color_pallet.dart';
import 'package:treely/firebase_options.dart';

import 'routes/routes.dart';

int? initScreen;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  SharedPreferences prefs = await SharedPreferences.getInstance();
  initScreen = prefs.getInt("initScreen");
  initScreen ?? await prefs.setInt("initScreen", 1);
  runApp(ProviderScope(child: Treely()));
}

class Treely extends StatelessWidget {
  Treely({super.key});
  final _appRouter = AppRouter();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Treely',
      theme: ThemeData(
        scaffoldBackgroundColor: kTertiaryColor,
        primarySwatch: Colors.green,
        textTheme: GoogleFonts.arapeyTextTheme(),
      ),
      routerConfig: _appRouter.config(),
    );
  }
}
