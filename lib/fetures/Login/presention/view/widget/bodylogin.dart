import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:open/core/styel.dart';
import 'package:open/core/utiles/assets.dart';
import 'package:open/core/utiles/background.dart';
import 'package:open/fetures/Home/presention/cubit/news_cubit.dart';
import 'package:open/fetures/Home/presention/view/Home.dart';
import 'package:open/fetures/Login/data/model/inputmodel.dart';
import 'package:open/fetures/Login/presention/manger/cubit/login_cubit.dart';
import 'package:open/fetures/Login/presention/view/widget/buttom.dart';
import 'package:open/fetures/Login/presention/view/widget/textfiled.dart';

import 'package:shared_preferences/shared_preferences.dart';

class BodyLoginpage extends StatefulWidget {
  const BodyLoginpage({super.key});

  @override
  State<BodyLoginpage> createState() => _BodyLoginpageState();
}

class _BodyLoginpageState extends State<BodyLoginpage> {
  GlobalKey<FormState> Formkey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  var token;
  @override
  Widget build(BuildContext context) {
    return CustomBackGround(
      chiledd: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: BlocListener<LoginCubit, LoginState>(
            listener: (context, state) async {
              if (state is Loginfauiler) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Center(
                        child: Text(state.errmas,
                            style: AppStyles.styleMedium14(context)
                                .copyWith(color: Colors.white))),
                    backgroundColor: Colors.blue,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16)),
                  ),
                );
              } else if (state is Loginscess) {
                BlocProvider.of<NewsCubit>(context)
                                .getcourses("News");
                token = state.loginRespone.token;
                SharedPreferences prefs = await SharedPreferences.getInstance();
                prefs.setString('o', token ?? "0");
                print('ahmed osama finish $token');
               
                prefs.setBool('isLoggedIn', true);

                Navigator.push(
                    context, MaterialPageRoute(builder: (builder) => Home()));
              }
            },
            child: Form(
              key: Formkey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * .05,
                  ),
                  Center(
                    child: Column(
                      children: [
                        Image.asset(Assets.assetsImageLogin1),
                        SizedBox(
                          height: 60,
                        ),
                        Text(
                          "Welcome!",
                          style: AppStyles.stylesemibold32(context)
                              .copyWith(color: Colors.black),
                        ),
                        Text(
                          "You can login here",
                          style: AppStyles.stylesemibold24(context)
                              .copyWith(color: const Color(0xff0D1B2A)),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 60,
                  ),
                  const CustomTextfiled(
                      label: "email", icon: Icon(Icons.email)),
                  const SizedBox(
                    height: 22,
                  ),
                  const CustomTextfiled(
                      label: "pass", icon: Icon(Icons.password_outlined)),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    "Forget password ?",
                    style: AppStyles.styleRegular14(context)
                        .copyWith(color: Color(0xff2295EF)),
                  ),
                  const SizedBox(
                    height: 22,
                  ),
                  SininButom(
                    onPressed: () async {

                      var Loginmo = Logininput(
                          email: "AbdulMajeedSallam@gmail.com",
                          password: "P@ssw0rd");

                      print('ahmed osama $token');
                      if (Formkey.currentState!.validate()) {
                        BlocProvider.of<LoginCubit>(context).login(
                          Loginmo,
                          "Account/login",
                        );
                      } else {
                        autovalidateMode = AutovalidateMode.always;
                      }
                    },
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
