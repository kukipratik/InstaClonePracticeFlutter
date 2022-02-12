import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:insta_clone/Screen/login_screen.dart';
import 'package:insta_clone/Screen/signup_screen.dart';
import 'package:insta_clone/responsiveLayouts/mob_screen_layout.dart';
import 'package:insta_clone/responsiveLayouts/responsive_layout.dart';
import 'package:insta_clone/responsiveLayouts/web_screen_layout.dart';
import 'package:insta_clone/utils/colors.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  //what to do when it's web....
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            //These options are copied when you make web app in the firebase...
            apiKey: "AIzaSyB2SKha5poyxL4EK0K2Q65pejfrXqK_j74",
            // authDomain: "insta-clone-6a1e0.firebaseapp.com",
            projectId: "insta-clone-6a1e0",
            storageBucket: "insta-clone-6a1e0.appspot.com",
            messagingSenderId: "884990858",
            appId: "1:884990858:web:bce9f47d9ffed186675e73"));
  }
  //else do this...
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Insta Clone',
      theme: ThemeData.dark()
          .copyWith(scaffoldBackgroundColor: mobileBackgroundColor),

      // giving route to start with...
      initialRoute: "/signup",
      //defining the routes....
      routes: {
        "/login": (context) => const LoginScreen(),
        "/signup": (context) => const SignupScreen(),
      },

      home: const ResponsiveLayout(
          mobScreenLayout: MobScreenLayout(),
          webScreenLayout: WebScreenLayout()),
    );
  }
}
