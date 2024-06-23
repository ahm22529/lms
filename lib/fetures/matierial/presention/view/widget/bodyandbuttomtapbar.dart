import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:open/fetures/Assinment/presention/view/widget/tapbuttom.dart';
import 'package:open/fetures/Assinment/presention/view/widget/tapview.dart';
import 'package:open/fetures/Courses/data/model/enroli_courses_respno/enroli_courses_respno.dart';
import 'package:open/fetures/matierial/presention/manager/cubit/matierals_cubit_cubit.dart';
import 'package:open/fetures/matierial/presention/view/widget/leciteam.dart';

class BodyMatier extends StatelessWidget {
  const BodyMatier({super.key, required this.enroliCoursesRespno});
  final EnroliCoursesRespno enroliCoursesRespno;
  @override
  Widget build(BuildContext context) {
    return ButtomTabbar(
      enroliCoursesRespno: enroliCoursesRespno,
    );
  }
}

class ButtomTabbar extends StatefulWidget {
  const ButtomTabbar({
    super.key,
    required this.enroliCoursesRespno,
  });
  final EnroliCoursesRespno enroliCoursesRespno;
  @override
  State<ButtomTabbar> createState() => _ButtomTabbarState();
}

class _ButtomTabbarState extends State<ButtomTabbar>  with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    BlocProvider.of<MatieralsCubitCubit>(context).getcourses(
        "Students/CurrentCourseMaterial?CycleId=", widget.enroliCoursesRespno);
          _tabController = TabController(length: 2, vsync: this);
  }
  
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: CustomScrollView(
        slivers: [
          const SliverToBoxAdapter(
        
          ),
          SliverFillRemaining(
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                tapboton(tabController: _tabController),
                Expanded(
                  child: tabvie(tabController: _tabController),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}



class tabvie extends StatefulWidget {
  const tabvie({
    super.key,
    required this.tabController,
  }) ;

  final TabController tabController;

  @override
  State<tabvie> createState() => _tabvieState();
}

class _tabvieState extends State<tabvie> {
  @override
  Widget build(BuildContext context) {
    return TabBarView(
      controller: widget.tabController,
      children: const [
        Padding(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: GridviewLec(),
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: GridviewLec(),
        ),
      ],
    );
  }
}
