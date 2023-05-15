import 'package:auto_route/auto_route.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:treely/helpers/show_snack_bar.dart';
import 'package:treely/routes/routes.gr.dart';
import '../../config/color_pallet.dart';
import '../../widgets/loader_dialog.dart';
import '../../widgets/loading.dart';
import '../../widgets/rounded_button.dart';
import '../../widgets/rounded_input_field.dart';
import '../../widgets/rounded_password_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<State> _LoaderDialog = new GlobalKey<State>();
  bool loading = false;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    String emailAddress = "";
    String password = "";
    return Scaffold(
      body: LoaderOverlay(
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text(
                  "LOGIN",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(height: size.height * 0.03),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Image.asset(
                    "assets/images/leaf_background.png",
                    height: size.height * 0.5,
                    width: size.width,
                  ),
                ),
                SizedBox(height: size.height * 0.03),
                RoundedInputField(
                  hintText: "Email",
                  prefixWidget: const Icon(
                    Icons.mail,
                    color: kPrimaryColor,
                  ),
                  onChanged: (value) {
                    emailAddress = value;
                  },
                ),
                RoundedPasswordField(
                  onChanged: (value) {
                    password = value;
                  },
                ),
                RoundedButton(
                  text: "LOGIN",
                  onPressed: () async {
                    try {
                      setState(() {
                        loading = true;
                      });
                      context.loaderOverlay.show();
                      UserCredential user = await FirebaseAuth.instance
                          .signInWithEmailAndPassword(
                              email: emailAddress, password: password);
                      user.credential ??
                          context.router.push(const HomeScreen());
                    } on FirebaseAuthException catch (e) {
                      context.loaderOverlay.hide();
                      if (e.code == 'user-not-found') {
                        showSnackBar(context, 'No user found for that email.');
                      } else if (e.code == 'wrong-password') {
                        showSnackBar(
                            context, 'Wrong password provided for that user.');
                      } else {
                        showSnackBar(context, e.message ?? "Error");
                      }
                    }
                  },
                ),
                SizedBox(height: size.height * 0.03),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
