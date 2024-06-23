import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:open/core/styel.dart';
import 'package:open/fetures/grad/prsention/grad.dart';
import 'package:open/fetures/grad/prsention/manager/cubit/grad_cubit.dart';
import 'package:open/fetures/grad/prsention/view/Tabelgrid.dart';

class bodyGrad extends StatefulWidget {
  const bodyGrad({super.key, required this.cid});
  final String cid;
  @override
  State<bodyGrad> createState() => _bodyGradState();
}

class _bodyGradState extends State<bodyGrad> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    BlocProvider.of<GradCubit>(context).getcourses(
        "Students/GetAllGradesForCurrentCourse?courseId=", widget.cid);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 20,
          ),
          Text(
            "Grad",
            style: AppStyles.stylesemibold32(context)
                .copyWith(color: const Color(0xff009688)),
          ),
          const SizedBox(
            height: 30,
          ),
          Center(
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.transparent,
              ),
              child: const tabelgrad(),
            ),
          ),
        ],
      ),
    );
  }
}
