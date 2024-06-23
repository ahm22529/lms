import 'package:flutter/material.dart';
import 'package:open/core/styel.dart';

class columiteam extends StatelessWidget {
  const columiteam({super.key, required this.str1, required this.str2});
  final String str1, str2;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          str1,
          style: AppStyles.stylebold13(context).copyWith(color: Colors.black),
        ),
        Text(
          str2,
          style: AppStyles.stylebold13(context).copyWith(color: Colors.black),
        )
      ],
    );
  }
}
