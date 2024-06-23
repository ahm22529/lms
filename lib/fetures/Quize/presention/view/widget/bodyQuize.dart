import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:open/core/styel.dart';
import 'package:open/fetures/Courses/data/model/enroli_courses_respno/enroli_courses_respno.dart';
import 'package:open/fetures/Quize/data/model/quize_model/quize_model.dart';
import 'package:open/fetures/Quize/presention/manager/cubit/quize_cubit.dart';
import 'package:open/fetures/Quize/presention/view/widget/iteamQuize.dart';

class QuizeBody extends StatefulWidget {
  const QuizeBody({super.key, required this.enroliCoursesRespno});
  final EnroliCoursesRespno enroliCoursesRespno;
  @override
  State<QuizeBody> createState() => _QuizeBodyState();
}

class _QuizeBodyState extends State<QuizeBody> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<QuizeCubit>(context).getQuize(
        "Students/CurrentCourseQuizzes?CycleId=", widget.enroliCoursesRespno);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Center(
                child: Text(
              "Quizzes",
              style: AppStyles.stylebold24(context)
                  .copyWith(color: const Color(0xff2398F5)),
            )),
          ),
          SliverToBoxAdapter(
            child: BlocBuilder<QuizeCubit, QuizeState>(
              builder: (context, state) {
                if (state is Quizesucess) {
                  return ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: state.quiz.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5.0),
                        child: quizesstate(
                          quizeModel: state.quiz[index],
                        ),
                      );
                    },
                  );
                } else {
                  return const Center(child: CircularProgressIndicator());
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}

// ignore: camel_case_types
class quizesstate extends StatelessWidget {
  const quizesstate({super.key, required this.quizeModel});
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
    return getStatus('', '') == 'finished'
        ? iteamQuizecomp(
            quizeModel: quizeModel,
          )
        : iteamQuizeNotcomp(
            quizeModel: quizeModel,
          );
  }
}
