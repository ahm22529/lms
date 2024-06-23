import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:open/fetures/Quize/data/model/quize_model/quize_model.dart';
import 'package:open/fetures/Quize/presention/view/widget/BodyQuizeIteam.dart';

// ignore: camel_case_types
class iteamQuizeNotcomp extends StatelessWidget {
  const iteamQuizeNotcomp({
    super.key,
    required this.quizeModel,
  });
  final QuizeModel quizeModel;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(2),
          border: Border.all(color: const Color(0xff3D5CFF))),
      child: BodyiteamQuizeNotcomp(
        quizeModel: quizeModel,
      ),
    );
  }
}

class iteamQuizecomp extends StatelessWidget {
  const iteamQuizecomp({
    super.key,
    required this.quizeModel,
  });
  final QuizeModel quizeModel;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(2),
          border: Border.all(color: const Color(0xff3D5CFF))),
      child: BodyiteamQuize(
        quizeModel: quizeModel,
      ),
    );
  }
}
