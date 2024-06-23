import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:open/core/utiles/background.dart';
import 'package:open/fetures/Courses/data/repo/Repo.dart';
import 'package:open/fetures/Courses/data/repo/RepoImp.dart';
import 'package:open/fetures/Courses/presention/manager/cubit/enroil_cubit_cubit.dart';
import 'package:open/fetures/Courses/presention/view/widget/headerenroil.dart';
import 'package:open/fetures/Courses/presention/view/widget/iteamenroilcourses.dart';
import 'package:open/fetures/Home/presention/view/widget/Appbar.dart';

class EnroilCourses extends StatefulWidget {
  const EnroilCourses({super.key});

  @override
  State<EnroilCourses> createState() => _EnroilCoursesState();
}

class _EnroilCoursesState extends State<EnroilCourses> {
  EnroliRepo enroliRepo = EnroliRepoImp();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    BlocProvider.of<EnroilCubitCubit>(context)
        .getcourses('Students/CurrentCourcesInfo');
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EnroilCubitCubit, EnroilCubitState>(
      builder: (context, state) {
        if (state is EnroilCubsucess) {
          return CustomBackGround(
              chiledd: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: CustomScrollView(
              slivers: [
                const SliverToBoxAdapter(
                  child: SafeArea(child: CustomApbar()),
                ),
                const SliverToBoxAdapter(
                  child: HeaderEnroilCoureses(),
                ),
                SliverToBoxAdapter(
                  child: ListView.builder(
                      itemCount: state.Enroil.length,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) => Padding(
                            padding: EdgeInsets.only(bottom: 015.0),
                            child: iteamenroilcourses(
                              image: state.Enroil[index].imagePath!,
                              name: state.Enroil[index].name!,
                              inst: state.Enroil[index].instructorFullName!,
                              enroliCoursesRespno: state.Enroil[index],
                            ),
                          )),
                )
              ],
            ),
          ));
        } else {
          return CircleAvatar();
        }
      },
    );
  }
}
