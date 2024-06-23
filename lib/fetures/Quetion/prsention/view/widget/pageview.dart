import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:open/fetures/Quetion/prsention/manger/que/que_cubit.dart';
import 'package:open/fetures/Quetion/prsention/manger/submi/subme_cubit.dart';
import 'package:open/fetures/Quetion/prsention/view/widget/Bodyquetion.dart';
import 'package:open/fetures/Quetion/prsention/view/widget/Choose.dart';
import 'package:open/fetures/Quetion/prsention/view/widget/grad0.dart';
import 'package:open/fetures/Quize/data/model/quize_model/quize_model.dart';
import 'package:timer_count_down/timer_count_down.dart';

class Bod extends StatefulWidget {
  const Bod({Key? key, required this.quizeModel}) : super(key: key);

  final QuizeModel quizeModel;

  @override
  State<Bod> createState() => _BodState();
}

class _BodState extends State<Bod> {
  late List<List<int>> selectedIndexList;
  late List<int> selectedvule;
  late PageController? pageController;
  late int _currentPageIndex;
  late int _totalQuizTimeInSeconds;

  @override
  void initState() {
    super.initState();
    selectedIndexList = List.generate(5, (index) => [-1]);
    selectedvule = List.filled(5, -1);
    _currentPageIndex = 0;
    _totalQuizTimeInSeconds = 120; // 2 minutes = 120 seconds
    BlocProvider.of<QueCubit>(context)
        .getQues("Students/Quiz?quizId=", widget.quizeModel);

    pageController = PageController(initialPage: 0)
      ..addListener(() {
        setState(() {});
      });
  }

  void updateSelectedIndex(int index, int selectedIndex) {
    setState(() {
      selectedIndexList[index] = [selectedIndex];
    });
  }

  int calculateRemainingTime(int currentIndex) {
    int elapsedTime = _currentPageIndex * 60; // تحويل الوقت المنقضي إلى ثواني
    return _totalQuizTimeInSeconds - elapsedTime;
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<QueCubit, QueState>(
      builder: (context, state) {
        if (state is Quesucesss) {
          int n=state.que.grade!.toInt();
          String timeString = state.que.duration!;
          List<String> timeParts = timeString.split(':');
          int hours = int.parse(timeParts[0]);
          int minutes = int.parse(timeParts[1]);
          int seconds = int.parse(timeParts[2]);
          int totalSeconds = (hours * 3600) + (minutes * 60) + seconds;
          
          String startTimeString = state.que.startDate!;
          DateTime? startTime = DateTime.tryParse(startTimeString);
          int startHour = startTime != null ? startTime.hour : 0;
          int startMinute = startTime != null ? startTime.minute : 0;
          int startSecond = startTime != null ? startTime.second : 0;
          int startTimeSeconds =
              (startHour * 3600) + (startMinute * 60) + startSecond;

          String endTimeString = state.que.endDate!;
          DateTime? endTime = DateTime.tryParse(endTimeString);
          int endHour = endTime != null ? endTime.hour : 0;
          int endMinute = endTime != null ? endTime.minute : 0;
          int endSecond = endTime != null ? endTime.second : 0;
          int endTimeSeconds = (endHour * 3600) + (endMinute * 60) + endSecond;

          int availableTime = endTimeSeconds - startTimeSeconds;
          int quizTime = totalSeconds;
          if (availableTime < quizTime) {
            quizTime = availableTime;
          }

          return Column(
            children: [
              Row(
                children: [
                  RichText(
                    text: const TextSpan(
                      text: "quiz ",
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                      children: [
                        TextSpan(
                          text: "1",
                          style: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                            color: Color(0xff2B99F0),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Spacer(),
                  const Icon(Icons.alarm),
                  // تحويل الوقت من الصيغة "ساعات:دقائق:ثواني" إلى عدد الثواني المقابل

// استخدام عدد الثواني المحسوب لإنشاء Countdown widget
                  BlocBuilder<SubmeCubit, SubmeState>(
                    builder: (context, state) {
                      return Countdown(
                        seconds: quizTime,
                        build: (BuildContext context, double time) => Text(
                          '${(time ~/ 3600).toString().padLeft(2, '0')}:${((time ~/ 60) % 60).toInt().toString().padLeft(2, '0')}:${(time % 60).toInt().toString().padLeft(2, '0')}',
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Color(0xffFF0404),
                          ),
                        ),
                        interval: const Duration(milliseconds: 100),
                        onFinished: () {
                          BlocProvider.of<SubmeCubit>(context)
                              .login(lll, "Students/quiz/submit");
                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (builder)=>GradQuiz(i:5, j: n,)))    ;
                        },
                      );
                    },
                  ),
                ],
              ),
              Expanded(
                child: PageView.builder(
                  controller: pageController,
                  itemCount: 5,
                  itemBuilder: (context, index) => BodyQuetion(
                    key: Key(index.toString()),
                    quizeModel: widget.quizeModel,
                    q: state.que.questions![index].answers!,
                    qu: state.que.questions![index].text!,
                    i: index,
                    selectedIndexList: selectedIndexList[index],
                    g: calculateRemainingTime(index),
                    pageController: pageController!,
                    onSelectedIndexChanged: (selectedIndex) {
                      updateSelectedIndex(index, selectedIndex);
                    },
                    selectedvule: selectedvule,
                    quid: state.que.questions![index].id!,
                    m: state.que
                        .grade!, // تم تمرير pageController كوسيط إلى BodyQuestion
                  ),
                ),
              ),
            ],
          );
        } else {
          return const CircularProgressIndicator();
        }
      },
    );
  }
}
