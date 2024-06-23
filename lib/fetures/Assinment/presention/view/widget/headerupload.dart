import 'package:flutter/material.dart';
import 'package:open/core/styel.dart';
import 'package:open/fetures/Assinment/data/model/task_model_response/task_model_response.dart';

class HeaderUpload extends StatelessWidget {
  const HeaderUpload({
    super.key,
    required this.response,
  });
  final TaskModelResponse response;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(
            response.taskName!,
            style: AppStyles.stylebold20(context).copyWith(color: Colors.black),
          ),
          RichText(
            text: TextSpan(
                text: "dedline: ",
                style: AppStyles.stylebold16(context)
                    .copyWith(color: Colors.black),
                children: [
                  TextSpan(
                    text: response.endDate.toString(),
                    style: AppStyles.stylebold16(context)
                        .copyWith(color: const Color(0xffC43D28)),
                  ),
                ]),
          ),
          Text(
            "nots",
            style: AppStyles.stylebold20(context).copyWith(color: Colors.black),
          ),
        ],
      ),
    );
  }
}
