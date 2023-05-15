import 'package:auto_route/auto_route.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:treely/helpers/show_snack_bar.dart';
import 'package:treely/routes/routes.gr.dart';
import '../../config/color_pallet.dart';
import '../../widgets/rounded_button.dart';
import '../../widgets/rounded_input_field.dart';
import '../../widgets/rounded_password_field.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    String email = "";
    String password = "";
    return Scaffold(
      body: SafeArea(
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
                onChanged: (value) {},
              ),
              RoundedInputField(
                hintText: "Email",
                prefixWidget: const Icon(
                  Icons.mail,
                  color: kPrimaryColor,
                ),
                onChanged: (value) {
                  email = value;
                },
              ),
              RoundedPasswordField(
                onChanged: (value) {
                  password = value;
                },
              ),
              RoundedButton(
                text: "SIGN UP",
                onPressed: () async {
                  try {
                    await FirebaseAuth.instance.createUserWithEmailAndPassword(
                      email: email,
                      password: password,
                    );
                    context.router.push(const HomeScreen());
                  } on FirebaseAuthException catch (e) {
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
                    print(e);
                  }
                },
              ),
              SizedBox(height: size.height * 0.03),
            ],
          ),
        ),
      ),
    );
  }
}
