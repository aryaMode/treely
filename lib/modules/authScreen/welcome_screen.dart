import 'package:auto_route/auto_route.dart';
import 'package:treely/routes/routes.gr.dart';
import 'package:flutter/material.dart';
import 'package:treely/config/color_pallet.dart';

import '../../widgets/rounded_button.dart';


@RoutePage()
class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: kTertiaryColor,
      body: Stack(
        children: [
          SizedBox(
            height: size.height,
            width: double.infinity,
            child: Opacity(
              opacity: 0.1,
              child: Image.asset(
                "assets/images/leaf_background.png",
                fit: BoxFit.fill,
              ),
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text(
                  "Welcome to Treely",
                  style: TextStyle(
                      fontWeight: FontWeight.w900,
                      fontSize: 38,
                      color: kDarkBrown),
                ),
                SizedBox(height: size.height * 0.05),
                RoundedButton(
                  text: "Login",
                  onPressed: () {
                    context.router.push(const LoginScreen());
                  },
                ),
                RoundedButton(
                  text: "Sign Up",
                  onPressed: () {
                    context.router.push(const SignupScreen());
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
