import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:open/fetures/Assinment/presention/manager/getAssinment/assinmentget_cubit.dart';
import 'package:open/fetures/Assinment/presention/view/widget/bodysliverdone.dart';
import 'package:open/fetures/Assinment/presention/view/widget/tapbuttom.dart';
import 'package:open/fetures/Assinment/presention/view/widget/tapview.dart';
import 'package:open/fetures/Courses/data/model/enroli_courses_respno/enroli_courses_respno.dart';

class Assinmentbody extends StatefulWidget {
  const Assinmentbody({super.key, required this.enroliCoursesRespno});
  final EnroliCoursesRespno enroliCoursesRespno;
  @override
  State<Assinmentbody> createState() => _AssinmentbodyState();
}

class _AssinmentbodyState extends State<Assinmentbody>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState() {
    super.initState();
    BlocProvider.of<AssinmentgetCubit>(context).getcourses(
        "Students/CurrentCourseTasks?CycleId=", widget.enroliCoursesRespno);
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: CustomScrollView(
        slivers: [
          const SliverToBoxAdapter(
            child: BodySliverDpone(),
          ),
          SliverFillRemaining(
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                tapboton(tabController: _tabController),
                Expanded(
                  child: tabview(tabController: _tabController),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
