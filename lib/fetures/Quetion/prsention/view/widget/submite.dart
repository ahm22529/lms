import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:open/core/styel.dart';
import 'package:open/fetures/Quetion/prsention/manger/que/que_cubit.dart';
import 'package:open/fetures/Quetion/prsention/manger/submi/subme_cubit.dart';
import 'package:open/fetures/Quetion/prsention/view/widget/Choose.dart';
import 'package:open/fetures/Quetion/prsention/view/widget/grad0.dart';

class subimet extends StatefulWidget {
  const subimet({
    super.key,
    this.quizid,
    required this.l,
    required this.gr,
  });
  final quizid;
  final List l;
  final int gr;
  @override
  State<subimet> createState() => _subimetState();
}

class _subimetState extends State<subimet> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<SubmeCubit, SubmeState>(
      listener: (context, state) {
        // TODO: implement listener
        if(state is Submesucess)
        {
          Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (builder) => GradQuiz(
                                i: checkStateList(state.sub).length,
                                j: widget.gr,
                              )));
        }
      },
      child: Row(
        children: [
          Expanded(
            child: TextButton(
                style: TextButton.styleFrom(backgroundColor: Color(0xff2B99F0)),
                onPressed: () {
                  BlocProvider.of<SubmeCubit>(context)
                      .login(lll, "Students/quiz/submit");
                  print("mmmmmmmmmm$lll");
                  var d = {"quizId": widget.quizid, "answers": widget.l};

                  
                  print(d);
                },
                child: Text(
                  "submit",
                  style: AppStyles.stylebold24(context)
                      .copyWith(color: Colors.white),
                )),
          )
        ],
      ),
    );
  }

  List<bool> checkStateList(List<dynamic> stateList) {
    List<bool> resultList = [];
    for (var item in stateList) {
      if (item.values.first == true) {
        resultList.add(true);
      } 
    }
    return resultList;
  }
}
