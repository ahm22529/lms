import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:open/core/utiles/assets.dart';

class CustomApbar extends StatelessWidget {
  const CustomApbar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: () {
            Scaffold.of(context).openDrawer();
          },
          child: SvgPicture.asset(Assets.assetsImageDrawer),
        ),
        SvgPicture.asset(Assets.assetsImageNotification),
      ],
    );
  }
}

