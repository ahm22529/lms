import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:open/core/styel.dart';
import 'package:open/fetures/Courses/data/model/enroli_courses_respno/enroli_courses_respno.dart';
import 'package:open/fetures/matierial/data/Repo/MatieralsRepo.dart';
import 'package:open/fetures/matierial/data/Repo/MatieralsRepoImp.dart';
import 'package:open/fetures/matierial/presention/manager/cubit/matierals_cubit_cubit.dart';
import 'package:open/fetures/matierial/presention/view/widget/bodyandbuttomtapbar.dart';

// ignore: camel_case_types
class matierial extends StatefulWidget {
  const matierial({super.key, required this.enroliCoursesRespno});
  final EnroliCoursesRespno enroliCoursesRespno;
  @override
  State<matierial> createState() => _matierialState();
}

class _matierialState extends State<matierial> {
  @override
  Widget build(BuildContext context) {
    matRep mat = matRepimp() as matRep;
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "Parallel Programming",
            style: AppStyles.stylebold16(context).copyWith(color: Colors.black),
          ),
          leading: Icon(Icons.keyboard_arrow_left, color: Colors.black),
        ),
        body: MultiBlocProvider(
            providers: [
              BlocProvider(create: (context) => MatieralsCubitCubit(rep: mat))
            ],
            child: BodyMatier(
              enroliCoursesRespno: widget.enroliCoursesRespno,
            )));
  }
}
