import 'package:flutter/material.dart';
import 'package:open/core/styel.dart';

class Quetionheader extends StatelessWidget {
  const Quetionheader({
    super.key,
    required this.qu,
  });
  final String qu;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Color(0xff3E5DFF))),
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: Text(
          qu,
          style: AppStyles.stylebold20(context).copyWith(color: Colors.black),
        ),
      ),
    );
  }
}
