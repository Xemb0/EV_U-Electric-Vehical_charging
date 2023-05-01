import 'package:ev_u/Screens/reset_password.dart';
import 'package:ev_u/Screens/sign_up.dart';
import 'package:flutter/cupertino.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../reusable/loog_ev.dart';
import 'home_screen.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  TextEditingController _emailTextController = TextEditingController();
  TextEditingController _passwordTextController = TextEditingController();

  @override
  void dispose() {
    _emailTextController.dispose();
    _passwordTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.blue[200]!,
                Colors.blue[400]!,
                Colors.blue[600]!,
                Colors.blue[800]!,
              ],
            ),
          ),
          width: double.infinity,
          height: MediaQuery
              .of(context)
              .size
              .height,
          padding: const EdgeInsets.fromLTRB(20, 80, 20, 0),
          child: Column(
            children: <Widget>[
              logoWidget("assets/images/EV_U_logo.png"),
              const SizedBox(height: 20),
              reusableTextField(
                "Enter UserName",
                Icons.person_outline,
                false,
                _emailTextController,
              ),
              const SizedBox(height: 20),
              reusableTextField(
                "Enter Password",
                Icons.lock_outline,
                true,
                _passwordTextController,
              ),
              const SizedBox(height: 20),
              forgetPassword(context),
              firebaseUIButton(context, "Sign In", () {
                FirebaseAuth.instance
                    .signInWithEmailAndPassword(
                    email: _emailTextController.text,
                    password: _passwordTextController.text)
                    .then((value) {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => HomeScreen()));
                }).onError((error, stackTrace) {
                  print("Error ${error.toString()}");
                });
              }),
              signUpOption(context),

            ],
          ),
        ),
      ),
    );
  }

  Image logoWidget(String imageName) {
    return Image.asset(
      imageName,
      fit: BoxFit.fitWidth,
      width: 200,
      height: 200,
      color: Colors.white,
    );
  }

  TextField reusableTextField(String text, IconData icon, bool isPasswordType,
      TextEditingController controller) {
    return TextField(
      controller: controller,
      obscureText: isPasswordType,
      enableSuggestions: !isPasswordType,
      cursorColor: Colors.white,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        prefixIcon: Icon(
          icon,
          color: Colors.white70,
        ),
        labelText: text,
        labelStyle: const TextStyle(color: Colors.white70),
        filled: true,
        fillColor: Colors.white.withOpacity(0.3),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }

  Row signUpOption(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Don't have account?",
            style: TextStyle(color: Colors.white70)),
        GestureDetector(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => SignUpScreen()));
          },
          child: const Text(
            " Sign Up",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }


  Widget forgetPassword(BuildContext context) {
    return Container(
      width: MediaQuery
          .of(context)
          .size
          .width,
      height: 35,
      alignment: Alignment.bottomRight,
      child: TextButton(
        child: const Text(
          "Forgot Password?",
          style: TextStyle(color: Colors.white70),
          textAlign: TextAlign.right,
        ),
        onPressed: () =>
            Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ResetPassword())),
      ),
    );
  }
}
