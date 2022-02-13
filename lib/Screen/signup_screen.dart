import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:insta_clone/resources/auth_method.dart';
import 'package:insta_clone/utils/colors.dart';
import 'package:insta_clone/utils/utils.dart';
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
  Uint8List? _image;
  bool _isLoading = false;

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
              _image != null
                  ? CircleAvatar(
                      radius: 55,
                      backgroundImage: MemoryImage(
                          _image!), //MemoryImage is for Uint8List file type...
                      // This will work easily for android but in ios we need to do some changes in the info.pist file....
                    )
                  : const CircleAvatar(
                      radius: 55,
                      backgroundImage:
                          NetworkImage("https://i.stack.imgur.com/l60Hf.png"),
                    ),
              Positioned(
                bottom: -10,
                left: 70,
                child: IconButton(
                    onPressed: () => selectImage(),
                    icon: const Icon(Icons.add_a_photo)),
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
            onTap: () => signUpUser(),
            child: Container(
              padding: const EdgeInsets.all(8),
              alignment: Alignment.center,
              width: double.infinity,
              child: _isLoading
                  ? const CircularProgressIndicator(
                    color: primaryColor,
                  )
                  : const Text(
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

  Future<void> selectImage() async {
    Uint8List im = await pickImage(ImageSource.gallery);
    setState(() {
      _image = im;
    });
  }

  Future<void> signUpUser() async {
    setState(() {
      _isLoading = true;
    });
    String res = await AuthMethods().signupUser(
      email: _emailController.text,
      password: _passwordController.text,
      userName: _userNameController.text,
      bio: _bioController.text,
      file: _image!,
    );
    setState(() {
      _isLoading = false;
    });
    if (res != 'sucess') {
      showSnackBar(res, context);
    } else {
      // Lazy me! Not doing anything...hump!!!
    }
  }
}
