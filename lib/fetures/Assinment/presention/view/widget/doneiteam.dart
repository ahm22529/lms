import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:open/core/styel.dart';

class done extends StatelessWidget {
  const done({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: SvgPicture.asset("Asset/image/Tick Square.svg"),
      title: Text(
        "Done 4 task today",
        style: AppStyles.styleRegular14(context).copyWith(color: Colors.white),
      ),
    );
  }
}
