import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:open/core/styel.dart';
import 'package:open/fetures/Home/presention/cubit/news_cubit.dart';
import 'package:open/fetures/Home/presention/view/Home.dart';
import 'package:open/fetures/Login/presention/view/Login.dart';
import 'package:open/fetures/Onbordingscreen/presention/view/widget/Dotindactore.dart';
import 'package:open/fetures/Onbordingscreen/presention/view/widget/pageview.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnBordingScreen extends StatefulWidget {
  const OnBordingScreen({super.key});

  @override
  State<OnBordingScreen> createState() => _OnBordingScreenState();
}

class _OnBordingScreenState extends State<OnBordingScreen> {
  PageController? pageController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    pageController = PageController(initialPage: 0)
      ..addListener(() {
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    log(MediaQuery.of(context).size.width.toString());
    return Column(
      children: [
        Expanded(
          flex: MediaQuery.of(context).size.width < 360 ? 3 : 6,
          child: CustomPageView(
            pageController: pageController,
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        Expanded(
          flex: 1,
          child: Column(
            children: [
              CustomDotsindecater(
                indexpage: pageController!.hasClients
                    ? pageController!.page!.toInt()
                    : 0,
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                        onPressed: () async {
                          if (pageController!.page! < 1) {
                            pageController?.nextPage(
                                duration: Duration(milliseconds: 500),
                                curve: Curves.easeIn);
                          } else {
                            BlocProvider.of<NewsCubit>(context)
                                .getcourses("News");
                            SharedPreferences prefs =
                                await SharedPreferences.getInstance();
                            bool isLoggedIn =
                                prefs.getBool('isLoggedIn') ?? false;

                            if (isLoggedIn) {
                              // افتح الصفحة الرئيسية
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (builder) => Home()));
                            } else {
                              // افتح صفحة تسجيل الدخول
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (builder) => Login()));
                            }
                          }
                        },
                        child: Text(
                          "next",
                          style: AppStyles.stylebold14(context),
                        )),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
