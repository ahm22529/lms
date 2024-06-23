import 'package:flutter/cupertino.dart';
import 'package:open/core/utiles/assets.dart';
import 'package:open/fetures/Onbordingscreen/presention/view/widget/iteampageview.dart';

class CustomPageView extends StatelessWidget {
  const CustomPageView({
    super.key,
    required this.pageController,
  });

  final PageController? pageController;

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: pageController,
      children: const [
        ItemPageView(
          img: Assets.assetsImageLandscape,
          title: 'Access Materials easy ',
          subtitle: 'All lectures, pdf and exams',
        ),
        ItemPageView(
          img: "Asset/image/landscape3.png",
          title: 'Access Materials offline',
          subtitle: 'Last lectures, labs and assignments',
        ),
      ],
    );
  }
}
