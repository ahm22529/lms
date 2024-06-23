import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:open/fetures/Assinment/data/model/assinmentiteammodel.dart';
import 'package:open/fetures/Assinment/data/model/task_model_response/task_model_response.dart';
import 'package:open/fetures/Assinment/presention/manager/getAssinment/assinmentget_cubit.dart';
import 'package:open/fetures/Assinment/presention/view/widget/notcompletandcomp%20.dart';

class ListviewNotComp extends StatefulWidget {
  const ListviewNotComp({super.key});

  @override
  State<ListviewNotComp> createState() => _ListviewNotCompState();
}

class _ListviewNotCompState extends State<ListviewNotComp> {
  List<TaskModelResponse> mm = [];
  int i = 0;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AssinmentgetCubit, AssinmentgetState>(
      builder: (context, state) {
        if (state is Assinmentgetsucess) {
          mm = state.task
              .where((element) => element.status == "No Submited Answers")
              .toList();
          return ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: mm.length,
              itemBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.symmetric(vertical: 3.0),
                    child: NotCompelete(
                      assinmentiteammodel: Assinmentiteammodel(
                          taskname: mm[index].taskName!,
                          start: mm[index].startDate.toString(),
                          end: mm[index].endDate.toString()),
                      response: mm[index],
                    ),
                  ));
        } else {
          return const Center(
            child: CircularProgressIndicator(
              backgroundColor: Color(0xff2295EF),
            ),
          );
        }
      },
      listener: (BuildContext context, AssinmentgetState state) {
        if (state is Assinmentgetsucess) {
          setState(() {
            mm = state.task;
          });
        }
      },
    );
  }
}

class ListviewComp extends StatefulWidget {
  const ListviewComp({super.key});

  @override
  State<ListviewComp> createState() => _ListviewCompState();
}

class _ListviewCompState extends State<ListviewComp> {
  List<TaskModelResponse> comp = [];

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AssinmentgetCubit, AssinmentgetState>(
      listener: (context, state) {
        if (state is Assinmentgetsucess) {
          comp = state.task;
        }
      },
      builder: (context, state) {
        if (state is Assinmentgetsucess) {
          comp = state.task
              .where((element) => element.status == "uploaded")
              .toList();
          return ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: comp.length,
              itemBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.symmetric(vertical: 3.0),
                    child: Compelete(
                      name: comp[index].taskName!,
                    ),
                  ));
        } else {
          return Center(
            child: CircularProgressIndicator(
              color: Color(0xff3B82F6),
            ),
          );
        }
      },
    );
  }
}
