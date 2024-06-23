import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:open/core/styel.dart';
import 'package:open/fetures/Assinment/data/repo/AssimentRepImp.dart';
import 'package:open/fetures/Assinment/data/repo/AssinmeRepo.dart';
import 'package:open/fetures/Assinment/presention/manager/getAssinment/assinmentget_cubit.dart';
import 'package:open/fetures/Assinment/presention/view/widget/assinmetbody.dart';
import 'package:open/fetures/Courses/data/model/enroli_courses_respno/enroli_courses_respno.dart';

class Assinment extends StatefulWidget {
  const Assinment({super.key, required this.enroliCoursesRespno});
  final EnroliCoursesRespno enroliCoursesRespno;
  @override
  State<Assinment> createState() => _AssinmentState();
}

class _AssinmentState extends State<Assinment> {
  AssinmetRepo assinmentREpo = AssinmentREpoImp();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        return AssinmentgetCubit(assinmentREpo: assinmentREpo);
      },
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "Parallel Programming",
            style: AppStyles.stylebold16(context).copyWith(color: Colors.black),
          ),
          leading: const Icon(Icons.keyboard_arrow_left, color: Colors.black),
        ),
        body: Assinmentbody(
          enroliCoursesRespno: widget.enroliCoursesRespno,
        ),
      ),
    );
  }
}
