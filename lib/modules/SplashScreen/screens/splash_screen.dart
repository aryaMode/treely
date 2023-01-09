import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:treely/config/color_pallet.dart';

import '../../../routes/routes.gr.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(
      const Duration(seconds: 3),
      () async {
        SharedPreferences pref = await SharedPreferences.getInstance();
        int? initScreen = await pref.getInt("initScreen");
        print(await pref.getInt("initScreen"));
        await context.router.replace(
            initScreen != 1 ? const WelcomeScreen() : const OnboardingScreen());
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: Stack(
        children: [
          SizedBox(
            height: size.height,
            width: double.infinity,
            child: Opacity(
              opacity: 0.2,
              child: Image.asset(
                "assets/images/leaf_background.png",
                fit: BoxFit.fill,
              ),
            ),
          ),
          const Center(
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Image(
                image: AssetImage('assets/images/logo.png'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
