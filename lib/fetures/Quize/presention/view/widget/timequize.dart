import 'package:flutter/material.dart';
import 'package:open/core/styel.dart';

class TimeQuize extends StatelessWidget {
  const TimeQuize({
    super.key,
    required this.s,
    required this.m,
  });
  final String s, m;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: const Color(0xff5570FF)),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 5),
            child: Text(
              s.substring(12, 15),
              style: AppStyles.styleRegular14(context).copyWith(fontSize: 16),
            ),
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        Text(
          "to",
          style: AppStyles.styleRegular14(context).copyWith(fontSize: 20),
        ),
        const SizedBox(
          width: 10,
        ),
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: const Color(0xffC43D28)),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 5),
            child: Text(
              m.substring(12, 15),
              style: AppStyles.styleRegular14(context).copyWith(fontSize: 16),
            ),
          ),
        )
      ],
    );
  }
}
