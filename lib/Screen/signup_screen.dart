import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:insta_clone/resources/auth_method.dart';
import 'package:insta_clone/utils/colors.dart';
import 'package:insta_clone/widget/text_field.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _bioController = TextEditingController();
  final TextEditingController _userNameController = TextEditingController();

//this dispose function will dispose the fields init once the widget is dispose...
  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _bioController.dispose();
    _userNameController.dispose();
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
            height: 60,
          ),
          const SizedBox(
            height: 24,
          ),
          Stack(
            children: [
              const CircleAvatar(
                radius: 55,
                backgroundColor: blueColor,
              ),
              Positioned(
                bottom: -10,
                left: 70,
                child: IconButton(
                    onPressed: () {}, icon: const Icon(Icons.add_a_photo)),
              )
            ],
          ),
          const SizedBox(
            height: 24,
          ),
          TextFieldInput(
              textEditingController: _userNameController,
              hintText: "Enter UserName",
              textInputType: TextInputType.text),
          const SizedBox(
            height: 15,
          ),
          //widget for entering the email....
          TextFieldInput(
              textEditingController: _emailController,
              hintText: "Your email",
              textInputType: TextInputType.emailAddress),
          const SizedBox(
            height: 15,
          ),
          //for entering password....
          TextFieldInput(
            textEditingController: _passwordController,
            hintText: "Enter your password",
            textInputType: TextInputType.emailAddress,
            isPassword: true,
          ),
          const SizedBox(
            height: 15,
          ),
          TextFieldInput(
              textEditingController: _bioController,
              hintText: "Your bio",
              textInputType: TextInputType.text),
          const SizedBox(
            height: 15,
          ),
          GestureDetector(
            onTap: () async {
              String res = await AuthMethods().signupUser(email: _emailController.text, password: _passwordController.text, userName: _userNameController.text, bio: _bioController.text,);
              print(res);
            },
            child: Container(
              padding: const EdgeInsets.all(8),
              alignment: Alignment.center,
              width: double.infinity,
              child: const Text(
                "SignUp",
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
            children: const [
              Text(
                "Don't have a account?",
                style: TextStyle(),
              ),
              Text("Sign up"),
            ],
          )
        ],
      ),
    )));
  }
}