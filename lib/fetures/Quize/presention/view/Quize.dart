import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:open/core/styel.dart';
import 'package:open/fetures/Courses/data/model/enroli_courses_respno/enroli_courses_respno.dart';
import 'package:open/fetures/Quize/data/Repo/QuizeRepo.dart';
import 'package:open/fetures/Quize/data/Repo/QuizeRepoImp.dart';
import 'package:open/fetures/Quize/presention/manager/cubit/quize_cubit.dart';
import 'package:open/fetures/Quize/presention/view/widget/bodyQuize.dart';

class Quize extends StatefulWidget {
  const Quize({super.key, required this.enroliCoursesRespno});
  final EnroliCoursesRespno enroliCoursesRespno;
  @override
  State<Quize> createState() => _QuizeState();
}

class _QuizeState extends State<Quize> {
  QuizeRpo quizeRpo = QuizeRepoImp();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        return QuizeCubit(quizeRpo: quizeRpo);
      },
      child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text(
              "Parallel Programming",
              style:
                  AppStyles.stylebold16(context).copyWith(color: Colors.black),
            ),
            leading: const Icon(Icons.keyboard_arrow_left, color: Colors.black),
          ),
          body: QuizeBody(
            enroliCoursesRespno: widget.enroliCoursesRespno,
          )),
    );
  }
}
