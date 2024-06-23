import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:open/core/styel.dart';
import 'package:open/fetures/Assinment/data/model/assinmentiteammodel.dart';
import 'package:open/fetures/Assinment/data/model/task_model_response/task_model_response.dart';
import 'package:open/fetures/Assinment/presention/view/widget/iteambodynocomp.dart';

class NotCompelete extends StatelessWidget {
  const NotCompelete(
      {super.key, required this.assinmentiteammodel, required this.response});
  final Assinmentiteammodel assinmentiteammodel;
  final TaskModelResponse response;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Color(0xff3B82F6))),
      child: bodyAAssinmentIteamnotcomp(
        assinmentiteammodel: assinmentiteammodel,
        taskModelResponse: response,
      ),
    );
  }
}

class Compelete extends StatelessWidget {
  const Compelete({super.key, required this.name});
  final String name;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Color(0xff3B82F6))),
      child: bodyAAssinmentIteamcomp(
        name: name,
      ),
    );
  }
}

class bodyAAssinmentIteamcomp extends StatelessWidget {
  const bodyAAssinmentIteamcomp({super.key, required this.name});
  final String name;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: SvgPicture.asset("Asset/image/Desk_alt.svg"),
      title: Text(
        name,
        style: AppStyles.stylebold16(context).copyWith(color: Colors.black),
      ),
      trailing: SvgPicture.asset("Asset/image/check.svg"),
    );
  }
}
