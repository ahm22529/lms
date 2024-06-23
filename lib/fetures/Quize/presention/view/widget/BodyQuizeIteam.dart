import 'package:flutter/material.dart';
import 'package:open/core/styel.dart';
import 'package:open/fetures/Quize/data/model/quize_model/quize_model.dart';
import 'package:open/fetures/Quize/presention/view/widget/bottomquize.dart';
import 'package:open/fetures/Quize/presention/view/widget/timequize.dart';

class BodyiteamQuizeNotcomp extends StatelessWidget {
  const BodyiteamQuizeNotcomp({
    super.key,
    required this.quizeModel,
  });
  final QuizeModel quizeModel;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: Text(
            quizeModel.title!,
            style: AppStyles.stylesemibold20(context)
                .copyWith(color: Colors.black),
          ),
        ),
        Text(
          "10 Points",
          style: AppStyles.styleMedium15(context).copyWith(color: Colors.black),
        ),
        const SizedBox(
          height: 15,
        ),
        Text(
          "From",
          style: AppStyles.styleRegular14(context).copyWith(fontSize: 20),
        ),
        const SizedBox(
          height: 5,
        ),
        TimeQuize(
          s: quizeModel.startDate!,
          m: quizeModel.endDate!,
        ),
        BottomQuize(
          quizeModel: quizeModel,
        )
      ],
    );
  }
}

class BodyiteamQuize extends StatelessWidget {
  const BodyiteamQuize({
    super.key,
    required this.quizeModel,
  });
  final QuizeModel quizeModel;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 30.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          BottomQuize(
            quizeModel: quizeModel,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: Text(
              quizeModel.title!,
              style: AppStyles.stylesemibold20(context)
                  .copyWith(color: Colors.black),
            ),
          ),
          Text(
            "10 Points",
            style:
                AppStyles.styleMedium15(context).copyWith(color: Colors.black),
          ),
        ],
      ),
    );
  }
}
