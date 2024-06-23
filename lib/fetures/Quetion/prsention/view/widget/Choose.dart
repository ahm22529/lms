import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:open/core/styel.dart';
import 'package:open/fetures/Quetion/data/model/quetionmodel/answer.dart';
import 'package:open/fetures/Quetion/prsention/manger/que/que_cubit.dart';
import 'package:open/fetures/Quize/data/model/quize_model/quize_model.dart';

typedef void SelectedIndexCallback(int index);

class choose extends StatefulWidget {
  const choose({
    Key? key,
    required this.quizeModel,
    required this.q,
    required this.selectedIndexList,
    required this.onSelectedIndexChanged,
    required this.selectedvule,
    required this.Qid, // Add the callback parameter
  }) : super(key: key);

  final QuizeModel quizeModel;
  final List<Answer> q;
  final List<int> selectedIndexList;
  final List<int> selectedvule;
  final SelectedIndexCallback onSelectedIndexChanged; // Define the callback
  final String Qid;
  @override
  _chooseState createState() => _chooseState();
}

List<Map> lll = [];

class _chooseState extends State<choose> {
  @override
  Widget build(BuildContext context) {
    return BlocListener<QueCubit, QueState>(
      listener: (context, state) {
        if (state is Quefailuer) {
          print(state.errmass);
        }
      },
      child: BlocBuilder<QueCubit, QueState>(
        builder: (context, state) {
          if (state is Quesucesss) {
            return ListView.builder(
              itemCount: widget.q.length,
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (BuildContext context, int index) {
                return CheckboxListTile(
                  activeColor: const Color(0xff2B99F0),
                  title: Text(
                    widget.q[index].text!,
                    style: AppStyles.styleMedium15(context).copyWith(
                      fontSize: 15,
                    ),
                  ),
                  value: widget.selectedIndexList.contains(index),
                  controlAffinity: ListTileControlAffinity.leading,
                  onChanged: (value) {
                    setState(() {
                      if (value!) {
                        print(state.que.questions![index].text);
                        lll.add({
                          "questionId": widget.Qid,
                          "answerId":
                              state.que.questions![index].answers![index].id
                        });
                        print(lll);
                        widget.selectedIndexList.clear();
                        widget.selectedIndexList.add(index);
                        widget.selectedvule[index] = index + 1;
                        print(widget.selectedvule);
                      } else {
                        widget.selectedIndexList.remove(index);
                        lll.remove(index);
                      }
                      // Call the callback function to notify the parent widget
                      widget.onSelectedIndexChanged(index);
                    });
                    print(widget.selectedIndexList);
                  },
                );
              },
            );
          } else {
            return const CircularProgressIndicator();
          }
        },
      ),
    );
  }
}
