import 'package:auto_route/auto_route.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:treely/helpers/show_snack_bar.dart';
import 'package:treely/routes/routes.gr.dart';
import '../../config/color_pallet.dart';
import '../../widgets/rounded_button.dart';
import '../../widgets/rounded_input_field.dart';
import '../../widgets/rounded_password_field.dart';

@RoutePage()
class SignupScreen extends StatelessWidget {
   SignupScreen({super.key});

  final  email = TextEditingController();
  final  password = TextEditingController();
  final  name = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: LoaderOverlay(
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text(
                  "SIGN UP",
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
                  hintText: "Name",
                  prefixWidget: const Icon(
                    Icons.person,
                    color: kPrimaryColor,
                  ),
                  onChanged: (value) {
                    name.text = value;
                  },
                ),
                RoundedInputField(
                  hintText: "Email",
                  prefixWidget: const Icon(
                    Icons.mail,
                    color: kPrimaryColor,
                  ),
                  onChanged: (value) {
                    email.text = value;
                  },
                ),
                RoundedPasswordField(
                  onChanged: (value) {
                    password.text = value;
                  },
                ),
                RoundedButton(
                  text: "SIGN UP",
                  onPressed: () async {
                    try {
                      context.loaderOverlay.show();
                      UserCredential user = await FirebaseAuth.instance
                          .createUserWithEmailAndPassword(
                        email: email.text,
                        password: password.text,
                      );
                      user.user?.updateDisplayName(name.text);
                      context.router.push(const HomeScreen());
                    } on FirebaseAuthException catch (e) {
                      context.loaderOverlay.hide();

                      if (e.code == 'weak-password') {
                        showSnackBar(
                            context, 'The password provided is too weak.');
                      } else if (e.code == 'email-already-in-use') {
                        showSnackBar(context,
                            'The account already exists for that email.');
                      } else {
                        showSnackBar(context, e.message ?? "Error");
                      }
                    } catch (e) {
                      context.loaderOverlay.hide();

                      showSnackBar(context, e.toString());
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
