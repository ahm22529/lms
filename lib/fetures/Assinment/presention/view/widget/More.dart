import 'package:flutter/material.dart';
import 'package:open/core/styel.dart';
import 'package:open/fetures/Assinment/data/model/task_model_response/task_model_response.dart';
import 'package:open/fetures/Assinment/presention/view/upload.dart';

class more extends StatelessWidget {
  const more({
    super.key,
    required this.response,
  });
  final TaskModelResponse response;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (builder) => upload(
                      response: response,
                    )));
      },
      style: TextButton.styleFrom(
          padding: const EdgeInsets.all(5), backgroundColor: Color(0xff3B82F6)),
      child: Text(
        "more",
        style: AppStyles.styleMedium15(context).copyWith(color: Colors.white),
      ),
    );
  }
}
