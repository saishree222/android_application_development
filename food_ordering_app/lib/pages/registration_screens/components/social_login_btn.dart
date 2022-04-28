import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_ordering_app/constant.dart';

class SocialLoginBtn extends StatefulWidget {
  const SocialLoginBtn({Key? key}) : super(key: key);

  @override
  State<SocialLoginBtn> createState() => _SocialLoginBtnState();
}

class _SocialLoginBtnState extends State<SocialLoginBtn> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MaterialButton(
          height: 50,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
          ),
          color: kSecondaryColor,
          onPressed: () {},
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const Text(
                "Login with Google",
                style: TextStyle(
                  color: kPrimaryColor,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SvgPicture.asset("assets/icons/google-icon.svg")
            ],
          ),
        ),
        const SizedBox(
          height: 10,
        ),

        //facebook button
        MaterialButton(
          height: 50,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
          ),
          color: kSecondaryColor,
          onPressed: () {},
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const Text(
                "Login with Facebook",
                style: TextStyle(
                  color: kPrimaryColor,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SvgPicture.asset("assets/icons/facebook.svg")
            ],
          ),
        ),
      ],
    );
  }
}
