import 'package:flutter/material.dart';
import 'package:open/core/styel.dart';
import 'package:open/fetures/Quetion/prsention/view/widget/Choose.dart';
import 'package:open/fetures/Quetion/prsention/view/widget/Finsish.dart';

class bottomnext extends StatefulWidget {
  const bottomnext({
    super.key,
    required this.pageController,
    required this.quizid,
    required this.l,
    required this.selectedIndexList, required this.i,
  });
  final PageController pageController;
  final String quizid;
  final List l;
  final List<int> selectedIndexList;
  final int i;
  @override
  State<bottomnext> createState() => _bottomnextState();
}

class _bottomnextState extends State<bottomnext> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextButton(
              style: TextButton.styleFrom(backgroundColor: Color(0xff2B99F0)),
              onPressed: () {
                if (widget.pageController!.page! < 4) {
                  widget.pageController?.nextPage(
                      duration: Duration(milliseconds: 500),
                      curve: Curves.easeIn);
                  final currentIndex = widget.pageController.page!.toInt();
                  print(widget.selectedIndexList.length + 1);
                } else {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (builder) => finished(
                                l: lll,
                                quizid: widget.quizid, i: widget.i,
                              )));
                }
              },
              child: Text(
                "next",
                style: AppStyles.stylebold24(context)
                    .copyWith(color: Colors.white),
              )),
        )
      ],
    );
  }
}
