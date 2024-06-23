import 'package:flutter/material.dart';
import 'package:open/fetures/Home/presention/view/widget/bodydrawer.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.bottomLeft,
              end: Alignment.center,
              colors: [Colors.blue, Colors.white],
            ),
          ),
          child: const BodyContiner()),
    );
  }
}
