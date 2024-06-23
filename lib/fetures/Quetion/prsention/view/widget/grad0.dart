import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:open/core/styel.dart';
import 'package:open/fetures/Quetion/prsention/manger/submi/subme_cubit.dart';

class GradQuiz extends StatelessWidget {
  const GradQuiz({super.key, required this.i, required this.j});
  final int i, j;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: bodyGridQuiz(
        i: i,
        j: j,
      ),
    );
  }
}

class bodyGridQuiz extends StatelessWidget {
  const bodyGridQuiz({super.key, required this.i, required this.j});
  final int i, j;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
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
                Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      border: Border.all(color: Color(0xff2B99F0))),
                  child: Text("$i/$j"),
                ),
              ],
            ),
          )
 
    );
  }
}
