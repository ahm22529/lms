import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:open/core/styel.dart';
import 'package:open/fetures/Quetion/data/Repo/QuesRepoImp.dart';
import 'package:open/fetures/Quetion/data/Repo/question.dart';

import 'package:open/fetures/Quetion/prsention/manger/que/que_cubit.dart';
import 'package:open/fetures/Quetion/prsention/manger/submi/subme_cubit.dart';

import 'package:open/fetures/Quetion/prsention/view/widget/pageview.dart';
import 'package:open/fetures/Quize/data/model/quize_model/quize_model.dart';

class Quetion extends StatefulWidget {
  const Quetion({super.key, required this.quizeModel});
  final QuizeModel quizeModel;
  @override
  State<Quetion> createState() => _QuetionState();
}

class _QuetionState extends State<Quetion> {
  QuestionRepo questionRepo = QuestionRepoImp();
  @override
  Widget build(BuildContext context) {
    return  MultiBlocProvider(
     providers: [
      BlocProvider(create: (context) {
        return QueCubit(questionRepo: questionRepo);

      }),
      BlocProvider(create: (context) {
        return SubmeCubit(questionRepo: questionRepo);

      }),

     ],
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
          body: Bod(
            quizeModel: widget.quizeModel,
          )),
    );
  }
}
