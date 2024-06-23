import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:open/core/styel.dart';
import 'package:open/fetures/Assinment/presention/view/widget/listviewdone.dart';

class BodCondone extends StatelessWidget {
  const BodCondone({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
          child: Text(
            "You are a superb warrior!",
            style:
                AppStyles.styleMedium14(context).copyWith(color: Colors.white),
          ),
        ),
        Row(
          children: [
            const Expanded(child: ListViewDone()),
            Image.asset("Asset/image/startup-3025714-2526912.png")
          ],
        )
      ],
    );
  }
}
