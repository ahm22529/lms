import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:open/core/styel.dart';

class HeaderEnroilCoureses extends StatelessWidget {
  const HeaderEnroilCoureses({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        RichText(
          text: TextSpan(
              text: "Enrolled",
              style:
                  AppStyles.stylebold20(context).copyWith(color: Colors.black),
              children: [
                TextSpan(
                  text: '5',
                  style: AppStyles.stylebold20(context)
                      .copyWith(color: const Color(0xff009688)),
                ),
                TextSpan(
                  text: 'courses',
                  style: AppStyles.stylebold20(context)
                      .copyWith(color: Colors.black),
                ),
              ]),
        ),
      ],
    );
  }
}
