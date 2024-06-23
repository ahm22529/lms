import 'package:flutter/material.dart';

import 'package:open/fetures/Quetion/data/model/quetionmodel/answer.dart';

import 'package:open/fetures/Quetion/prsention/view/widget/Choose.dart';
import 'package:open/fetures/Quetion/prsention/view/widget/Quetionheader.dart';
import 'package:open/fetures/Quetion/prsention/view/widget/botomnext.dart';
import 'package:open/fetures/Quize/data/model/quize_model/quize_model.dart';

class BodyQuetion extends StatefulWidget {
  const BodyQuetion({
    super.key,
    required this.quizeModel,
    required this.q,
    required this.qu,
    required this.i,
    required this.selectedIndexList,
    required this.g,
    required this.pageController,
    required this.onSelectedIndexChanged,
    required this.selectedvule,
    required this.quid, required this.m,
  });

  final QuizeModel quizeModel;
  final List<Answer> q;
  final String qu;
  final int i, g;
  final List<int> selectedIndexList;
  final List<int> selectedvule;
  final PageController pageController;
  final SelectedIndexCallback onSelectedIndexChanged;
  final String quid;
  final int m;
  @override
  State<BodyQuetion> createState() => _BodyQuetionState();
}

class _BodyQuetionState extends State<BodyQuetion> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: ListView(
        children: [
          const SizedBox(height: 20),
                    const SizedBox(height: 15),
          Center(
            child: RichText(
              text: TextSpan(
                text: "question ",
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
                children: [
                  TextSpan(
                    text: (widget.i + 1).toString(),
                    style: const TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff2B99F0),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 10),
          Quetionheader(qu: widget.qu),
          const SizedBox(height: 20),
          choose(
            quizeModel: widget.quizeModel,
            q: widget.q,
            selectedIndexList: widget.selectedIndexList,
            onSelectedIndexChanged: widget.onSelectedIndexChanged,
            selectedvule: widget.selectedvule,
            Qid: widget.quid,
          ),
          const SizedBox(height: 20),
          bottomnext(
            pageController: widget.pageController,
            quizid: 'Q001',
            l: [
              {"questionId": "Q001_1", "answerId": widget.q[1].id},
            ],
            selectedIndexList: widget.selectedvule, i: widget.m,
          ),
        ],
      ),
    );
  }
}
