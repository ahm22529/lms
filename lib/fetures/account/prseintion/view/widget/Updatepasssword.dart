import 'package:flutter/material.dart';
import 'package:open/core/styel.dart';
import 'package:open/core/utiles/assets.dart';
import 'package:open/core/utiles/background.dart';
import 'package:open/fetures/Login/presention/view/widget/buttom.dart';
import 'package:open/fetures/Login/presention/view/widget/textfiled.dart';

class Updatepass extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Bodyupadtepassword(),
    );
  }
}

class Bodyupadtepassword extends StatefulWidget {
  const Bodyupadtepassword({super.key});

  @override
  State<Bodyupadtepassword> createState() => _BodyupadtepasswordState();
}

class _BodyupadtepasswordState extends State<Bodyupadtepassword> {
  GlobalKey<FormState> Formkey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  @override
  Widget build(BuildContext context) {
    return CustomBackGround(
      chiledd: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
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
                      "update!",
                      style: AppStyles.stylesemibold32(context)
                          .copyWith(color: Colors.black),
                    ),
                    Text(
                      "update pass in educate",
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
                  label: "pass", icon: Icon(Icons.password_outlined)),
              const SizedBox(
                height: 22,
              ),
              const CustomTextfiled(
                  label: "comfirm", icon: Icon(Icons.password_outlined)),
              const SizedBox(
                height: 22,
              ),
              Row(
                children: [
                  Expanded(
                      child: TextButton(
                    onPressed: () {},
                    style: TextButton.styleFrom(
                        backgroundColor: Color(0xff2295EF)),
                    child: Text(
                      "update",
                      style: AppStyles.stylesemibold30(context)
                          .copyWith(color: Colors.white),
                    ),
                  ))
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
