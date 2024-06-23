import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:open/core/utiles/background.dart';
import 'package:open/fetures/calender/Presintion/manager/cubit/calender_cubit.dart';
import 'package:open/fetures/calender/Presintion/view/widget/cleandermobilebody.dart';
import 'package:open/fetures/calender/data/repo/RepoImp.dart';
import 'package:open/fetures/calender/data/repo/repo.dart';

class CalMobile extends StatefulWidget {
  const CalMobile({Key? key}) : super(key: key);

  @override
  State<CalMobile> createState() => _CalMobileState();
}

class _CalMobileState extends State<CalMobile> {
  final calREpo cal = CalenderREpImp();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CalenderCubit(cal: cal),
      child: const Scaffold(
        body: CustomBackGround(
          chiledd: Bodycalender(),
        ),
      ),
    );
  }
}
