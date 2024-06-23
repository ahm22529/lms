import 'package:flutter/material.dart';
import 'package:open/core/styel.dart';
import 'package:open/fetures/Quetion/prsention/view/Quition.dart';
import 'package:open/fetures/Quize/data/model/quize_model/quize_model.dart';

class BottomQuize extends StatelessWidget {
  const BottomQuize({
    super.key,
    required this.quizeModel,
  });
  final QuizeModel quizeModel;
  String getStatus(quizesstate, String endDateString) {
    DateTime startDate = DateTime.parse(quizeModel.startDate!);
    DateTime endDate = DateTime.parse(quizeModel.endDate!);
    DateTime now = DateTime.now();

    // إذا كان الآن قبل تاريخ البداية فإن حالة الاختبار هي "waiting"
    if (now.isBefore(startDate)) {
      return "waiting";
    }
    // إذا كان الآن بعد تاريخ النهاية فإن حالة الاختبار هي "finished"
    else if (now.isAfter(endDate)) {
      return "finished";
    }
    // في جميع الحالات الأخرى، حالة الاختبار هي "start"
    else {
      return "start";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 10),
            child: TextButton(
              onPressed:getStatus('', '') == 'waiting' ||
                          getStatus('start', '') == 'finished'?(){}: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (builder) => Quetion(
                              quizeModel: quizeModel,
                            )));
              },
              style: TextButton.styleFrom(
                  backgroundColor: getStatus('', '') == 'waiting' ||
                          getStatus('start', '') == 'finished'
                      ? const Color(0xff2295EF)
                      : Color(0xff2CB629)),
              child: Text(
                getStatus('', ''),
                style: AppStyles.stylesemibold24(context)
                    .copyWith(color: Colors.white),
              ),
            ),
          ),
        )
      ],
    );
  }
}

class BottomQuizefinsish extends StatelessWidget {
  const BottomQuizefinsish({
    super.key,
    required this.titel,
  });

  final String titel;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 10),
            child: TextButton(
              onPressed: () {},
              style: TextButton.styleFrom(
                  backgroundColor: const Color(0xff2295EF)),
              child: Text(
                titel,
                style: AppStyles.stylesemibold24(context)
                    .copyWith(color: Colors.white),
              ),
            ),
          ),
        )
      ],
    );
  }
}
