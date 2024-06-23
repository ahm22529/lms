import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../core/styel.dart';

class Information extends StatelessWidget {
  const Information({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          children: [
            Text(
              "Hi, Ahmed",
              style:
                  AppStyles.stylebold30(context).copyWith(color: Colors.black),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              "Timeline  here",
              style: AppStyles.stylebold24(context)
                  .copyWith(color: const Color(0xff808080)),
            ),
            const SizedBox(
              height: 10,
            )
          ],
        ),
        const Spacer(),
        const SizedBox(height: 125, width: 115, child: CircleAvatar())
      ],
    );
  }
}
