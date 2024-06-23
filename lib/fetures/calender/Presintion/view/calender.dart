import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:open/core/utiles/Adaptiveui.dart';
import 'package:open/fetures/calender/Presintion/manager/cubit/calender_cubit.dart';
import 'package:open/fetures/calender/Presintion/view/widget/Mobile.dart';
import 'package:open/fetures/calender/Presintion/view/widget/calndertablet.dart';
import 'package:open/fetures/calender/data/repo/RepoImp.dart';
import 'package:open/fetures/calender/data/repo/repo.dart';

class CalenderPage extends StatefulWidget {
  const CalenderPage({Key? key}) : super(key: key);

  @override
  State<CalenderPage> createState() => _CalenderPageState();
}

class _CalenderPageState extends State<CalenderPage> {
  
  calREpo cal =CalenderREpImp();
  @override
  Widget build(BuildContext context) {
    return AdaptiveUi(
      MobileLauyOut: (_) => const CalMobile(),
      TabletLayOut: (_) => BlocProvider(
        create: (context) => CalenderCubit(cal: cal),
        child: const caln(),
      ),
      DeskTopLayOut: (_) => const SizedBox(),
    );
  }
}
