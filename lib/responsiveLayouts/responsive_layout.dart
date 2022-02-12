import 'package:flutter/material.dart';
import 'package:insta_clone/utils/global_variable.dart';

class ResponsiveLayout extends StatelessWidget {
  final Widget mobScreenLayout;
  final Widget webScreenLayout;
  const ResponsiveLayout({
    Key? key,
    required this.mobScreenLayout,
    required this.webScreenLayout,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: ((context, constraints) {
        if (constraints.maxWidth > webScreenSize) {
          return webScreenLayout;
        }
        return mobScreenLayout;
      }),
    );
  }
}
