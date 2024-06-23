import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/cupertino.dart';

class CustomDotsindecater extends StatelessWidget {
  const CustomDotsindecater({super.key, required this.indexpage});
  final int indexpage;
  @override
  Widget build(BuildContext context) {
    return DotsIndicator(
        decorator: DotsDecorator(
            activeSize: const Size(40, 9.0),
            activeShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0)),
            activeColor: Color(0xff2295EF),
            size: const Size(20, 5),
            shape: const LinearBorder()),
        dotsCount: 2,
        position: indexpage);
  }
}
