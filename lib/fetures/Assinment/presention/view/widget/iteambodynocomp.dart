import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:open/core/styel.dart';
import 'package:open/fetures/Assinment/data/model/assinmentiteammodel.dart';
import 'package:open/fetures/Assinment/data/model/task_model_response/task_model_response.dart';
import 'package:open/fetures/Assinment/presention/view/widget/More.dart';

class bodyAAssinmentIteamnotcomp extends StatelessWidget {
  const bodyAAssinmentIteamnotcomp({
    super.key,
    required this.assinmentiteammodel,
    required this.taskModelResponse,
  });
  final TaskModelResponse taskModelResponse;
  final Assinmentiteammodel assinmentiteammodel;
  int calculateRemainingDays() {
    DateFormat formatter = DateFormat('yyyy-MM-dd');
    DateTime startDateTime = formatter.parse(assinmentiteammodel.start);
    DateTime endDateTime = formatter.parse(assinmentiteammodel.end);

    Duration difference = endDateTime.difference(startDateTime);
    int remainingDays = difference.inDays;

    return remainingDays;
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: SvgPicture.asset("Asset/image/Desk_alt.svg"),
      title: Text(
        assinmentiteammodel.taskname,
        style: AppStyles.stylebold16(context).copyWith(color: Colors.black),
      ),
      subtitle: Row(
        children: [
          Text(
            "Deadline",
            style:
                AppStyles.styleMedium14(context).copyWith(color: Colors.black),
          ),
          const SizedBox(
            width: 10,
          ),
          Text(
            'left  ${calculateRemainingDays().toString()} day',
            style: AppStyles.styleMedium14(context).copyWith(
                color: calculateRemainingDays() <= 1
                    ? Colors.red
                    : const Color(0xffD1FAE5)),
          )
        ],
      ),
      trailing: more(
        response: taskModelResponse,
      ),
    );
  }
}
