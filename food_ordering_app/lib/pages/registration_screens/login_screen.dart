import 'dart:html';

import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:food_ordering_app/constant.dart';
import 'package:food_ordering_app/pages/home/home_screen.dart';
import 'package:food_ordering_app/pages/registration_screens/components/social_login_btn.dart';
import 'package:food_ordering_app/pages/registration_screens/forgot_password.dart';
import 'package:food_ordering_app/pages/registration_screens/signup_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: kWhiteColor,
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: _size.height * 0.2,
                  ),
                  const Text(
                    "Login",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  const TextFeilds(),
                  SizedBox(
                    height: _size.height * 0.2,
                  ),
                  const SocialLoginBtn(),
                  SizedBox(
                    height: _size.height * 0.1,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Not registered?",
                        style: TextStyle(
                          color: kTextGrayColor,
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const SignUpScreen()));
                        },
                        child: const Text(
                          "Join Now",
                          style: TextStyle(
                              color: kPrimaryColor,
                              fontWeight: FontWeight.w600),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: _size.height * 0.2,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class TextFeilds extends StatefulWidget {
  const TextFeilds({
    Key? key,
  }) : super(key: key);

  @override
  State<TextFeilds> createState() => _TextFeildsState();
}

class _TextFeildsState extends State<TextFeilds> {
  final _formkey = GlobalKey<FormState>();
  var emailTextController = TextEditingController();
  var passwordTextController = TextEditingController();
  bool isvisible = true;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formkey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // email

          Container(
            padding: const EdgeInsets.only(left: 15),
            decoration: BoxDecoration(
                color: kGreyColor, borderRadius: BorderRadius.circular(50)),
            child: TextFormField(
              controller: emailTextController,
              keyboardType: TextInputType.emailAddress,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Enter Email Address";
                }
                final bool _isvalid =
                    EmailValidator.validate(emailTextController.text);
                if (!_isvalid) {
                  return "Invalid Email";
                }
                return null;
              },
              decoration: const InputDecoration(
                suffixIcon: Icon(Icons.email_outlined),
                hintText: "Email",
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
              ),
            ),
          ),
          //password
          const SizedBox(
            height: 20,
          ),

          Container(
            padding: const EdgeInsets.only(left: 15),
            decoration: BoxDecoration(
                color: kGreyColor, borderRadius: BorderRadius.circular(50)),
            child: TextFormField(
              obscureText: isvisible,
              controller: passwordTextController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Enter Password";
                }
                return null;
              },
              decoration: InputDecoration(
                suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      isvisible = !isvisible;
                    });
                  },
                  icon: isvisible == true
                      ? Icon(Icons.visibility)
                      : Icon(Icons.visibility_off),
                  color: isvisible == true ? kTextGrayColor : kPrimaryColor,
                ),
                hintText: "Password",
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
              ),
            ),
          ),
          // forget link
          TextButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ForgotPassword()));
            },
            child: const Text(
              "Forgot Password?",
              style: TextStyle(
                  fontSize: 15,
                  color: kPrimaryColor,
                  fontWeight: FontWeight.w600),
            ),
          ),
          const SizedBox(
            height: 20,
          ),

          //login
          MaterialButton(
            color: kPrimaryColor,
            minWidth: double.infinity,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50),
            ),
            height: 60,
            onPressed: () {
              if (_formkey.currentState!.validate()) {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HomeScreen()));
              }
            },
            child: const Text(
              "Login",
              style: TextStyle(
                color: kWhiteColor,
                fontSize: 16,
              ),
            ),
          )
        ],
      ),
    );
  }
}
