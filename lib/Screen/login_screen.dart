import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:insta_clone/utils/colors.dart';
import 'package:insta_clone/widget/text_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

//this dispose function will dispose the fields init once the widget is dispose...
  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Container(
      padding: const EdgeInsets.symmetric(horizontal: 32),
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          //this flexible is just used to fill available spaces...
          Flexible(
            child: Container(),
            flex: 1,
          ),
          //providing svg images...
          SvgPicture.asset(
            "assets/ic_instagram.svg",
            color: primaryColor,
            height: 65,
          ),
          const SizedBox(
            height: 24,
          ),
          //widget for entering the email....
          TextFieldInput(
              textEditingController: _emailController,
              hintText: "Your email",
              textInputType: TextInputType.emailAddress),
          const SizedBox(
            height: 20,
          ),
          TextFieldInput(
            textEditingController: _passwordController,
            hintText: "Password",
            textInputType: TextInputType.text,
            isPassword: true,
          ),
          const SizedBox(
            height: 20,
          ),
          InkWell(
            onTap: (){},
            child: Container(
              padding: const EdgeInsets.all(8),
              alignment: Alignment.center,
              width: double.infinity,
              child: const Text(
                "Login",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                ),
              ),
              decoration: BoxDecoration(
                color: blueColor,
                borderRadius: BorderRadius.circular(5),
              ),
            ),
          ),
          Flexible(
            child: Container(),
            flex: 1,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Don't have a account?",
                style: TextStyle(fontSize: 17),
              ),
              GestureDetector(
                onTap: (){},
                child: const Text(
                  " Sign up",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          )
        ],
      ),
    )));
  }
}
