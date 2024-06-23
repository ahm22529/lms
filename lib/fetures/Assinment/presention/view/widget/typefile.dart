import 'package:flutter/material.dart';
import 'package:open/core/styel.dart';

// ignore: camel_case_types
class typefile extends StatelessWidget {
  const typefile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 155,
      width: 210,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12), color: Color(0xffF62F10)),
      child: Center(
        child: Text(
          ".jpg",
          style: AppStyles.stylebold20(context).copyWith(color: Colors.white),
        ),
      ),
    );
  }
}
