import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:open/core/styel.dart';
import 'package:open/fetures/Quetion/data/Repo/QuesRepoImp.dart';
import 'package:open/fetures/Quetion/data/Repo/question.dart';
import 'package:open/fetures/Quetion/prsention/manger/submi/subme_cubit.dart';
import 'package:open/fetures/Quetion/prsention/view/widget/submite.dart';

class finished extends StatefulWidget {
  const finished({super.key, required this.l, required this.quizid, required this.i});
  final List l;
  final String quizid;
final int i;
  @override
  State<finished> createState() => _finishedState();
}

class _finishedState extends State<finished> {
  QuestionRepo questionRepo=QuestionRepoImp();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SubmeCubit(questionRepo: questionRepo),
      child: Scaffold(
        body: bodyfinsih(widget: widget),
      ),
    );
  }
}

class bodyfinsih extends StatelessWidget {
  const bodyfinsih({
    super.key,
    required this.widget,
  });

  final finished widget;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * .025,
            ),
            Text(
              "Finished !",
              style: AppStyles.stylesemibold32(context)
                  .copyWith(color: Color(0xff2295EF)),
            ),
            Text(
              "submet  your Answer",
              style: AppStyles.styleRegular14(context)
                  .copyWith(color: Color(0xff717171)),
            ),
            SizedBox(
              height: 20,
            ),
            Image.asset("Asset/image/Note Check.png"),
            SizedBox(
              height: 75,
            ),
            subimet(
              l: widget.l,
              quizid: widget.quizid, gr: widget.i
            )
          ],
        ),
      ),
    );
  }
}
