import 'package:flutter/cupertino.dart';
import 'package:open/core/styel.dart';

class ItemPageView extends StatelessWidget {
  const ItemPageView(
      {super.key,
      required this.img,
      required this.title,
      required this.subtitle});
  final String img, title, subtitle;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.width * .12,
        ),
        Image.asset(img),
        const SizedBox(
          height: 30,
        ),
        Text(title,
            textAlign: TextAlign.center, style: AppStyles.stylebold30(context)),
        const SizedBox(
          height: 10,
        ),
        Text(subtitle,
            textAlign: TextAlign.center,
            style: AppStyles.styleRegular20(context)
                .copyWith(color: Color(0xff0D1B2A).withOpacity(.7))),
        const SizedBox(
          height: 38,
        ),
      ],
    );
  }
}
