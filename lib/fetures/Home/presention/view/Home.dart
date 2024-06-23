import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:open/core/utiles/Adaptiveui.dart';
import 'package:open/core/utiles/background.dart';
import 'package:open/fetures/Home/presention/view/widget/mobile.dart';


class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomBackGround(
        chiledd: AdaptiveUi(
            MobileLauyOut: (context) => const Mobile(),
            TabletLayOut: (context) => const Mobile(),
            DeskTopLayOut: ((context) => const SizedBox())));
  }
}
