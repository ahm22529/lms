import 'package:flutter/material.dart';

class CustomBackGround extends StatelessWidget {
  const CustomBackGround({super.key, required this.chiledd});
  final Widget chiledd;
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.center,
            colors: [Colors.blue, Colors.white],
          ),
        ),
        child: chiledd);
  }
}
