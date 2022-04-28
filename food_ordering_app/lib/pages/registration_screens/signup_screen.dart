import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:food_ordering_app/constant.dart';
import 'package:food_ordering_app/pages/registration_screens/components/social_login_btn.dart';
import 'package:food_ordering_app/pages/registration_screens/login_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formkey = GlobalKey<FormState>();
  var emailTextController = TextEditingController();
  var passwordTextController = TextEditingController();
  var conformpasswordTextController = TextEditingController();
  var firstName = TextEditingController();
  var lastName = TextEditingController();
  bool isvisible = true;
  bool conformisvisible = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhiteColor,
      body: SafeArea(
        child: SizedBox(
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: SingleChildScrollView(
                child: Form(
                  key: _formkey,
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 50,
                      ),
                      const Spacer(),
                      const Text(
                        "Sign Up",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Container(
                        padding: const EdgeInsets.only(left: 15),
                        decoration: BoxDecoration(
                            color: kGreyColor,
                            borderRadius: BorderRadius.circular(50)),
                        child: TextFormField(
                          controller: emailTextController,
                          keyboardType: TextInputType.emailAddress,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Enter Email Address";
                            }
                            final bool _isvalid = EmailValidator.validate(
                                emailTextController.text);
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

                      const SizedBox(
                        height: 30,
                      ),
                      Container(
                        padding: const EdgeInsets.only(left: 15),
                        decoration: BoxDecoration(
                            color: kGreyColor,
                            borderRadius: BorderRadius.circular(50)),
                        child: TextFormField(
                          controller: firstName,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Enter First Name";
                            }

                            return null;
                          },
                          decoration: const InputDecoration(
                            suffixIcon: Icon(Icons.person_outline),
                            hintText: "First Name",
                            enabledBorder: InputBorder.none,
                            focusedBorder: InputBorder.none,
                          ),
                        ),
                      ),

                      const SizedBox(
                        height: 30,
                      ),
                      Container(
                        padding: const EdgeInsets.only(left: 15),
                        decoration: BoxDecoration(
                            color: kGreyColor,
                            borderRadius: BorderRadius.circular(50)),
                        child: TextFormField(
                          controller: lastName,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Enter Last Name";
                            }

                            return null;
                          },
                          decoration: const InputDecoration(
                            suffixIcon: Icon(Icons.person_outline),
                            hintText: "Last Name",
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
                            color: kGreyColor,
                            borderRadius: BorderRadius.circular(50)),
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
                              color: isvisible == true
                                  ? kTextGrayColor
                                  : kPrimaryColor,
                            ),
                            hintText: "Password",
                            enabledBorder: InputBorder.none,
                            focusedBorder: InputBorder.none,
                          ),
                        ),
                      ),

                      //confrom password
                      const SizedBox(
                        height: 20,
                      ),

                      Container(
                        padding: const EdgeInsets.only(left: 15),
                        decoration: BoxDecoration(
                            color: kGreyColor,
                            borderRadius: BorderRadius.circular(50)),
                        child: TextFormField(
                          obscureText: conformisvisible,
                          controller: conformpasswordTextController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Enter Password";
                            }
                            if (passwordTextController.text !=
                                conformpasswordTextController.text) {
                              return "Password do not match";
                            }

                            return null;
                          },
                          decoration: InputDecoration(
                            suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  conformisvisible = !conformisvisible;
                                });
                              },
                              icon: conformisvisible == true
                                  ? Icon(Icons.visibility)
                                  : Icon(Icons.visibility_off),
                              color: conformisvisible == true
                                  ? kTextGrayColor
                                  : kPrimaryColor,
                            ),
                            hintText: "Re-Enter Password",
                            enabledBorder: InputBorder.none,
                            focusedBorder: InputBorder.none,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),

                      //signUp

                      MaterialButton(
                        color: kPrimaryColor,
                        minWidth: double.infinity,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                        height: 60,
                        onPressed: () {
                          if (_formkey.currentState!.validate()) {}
                        },
                        child: const Text(
                          "Sign Up",
                          style: TextStyle(
                            color: kWhiteColor,
                            fontSize: 16,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      SocialLoginBtn(),
                      const SizedBox(
                        height: 20,
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Already a Member",
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
                                      builder: (context) =>
                                          const LoginScreen()));
                            },
                            child: const Text(
                              "LogIn",
                              style: TextStyle(
                                  color: kPrimaryColor,
                                  fontWeight: FontWeight.w600),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            )),
      ),
    );
  }
}
