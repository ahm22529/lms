import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:open/core/styel.dart';
import 'package:open/fetures/account/data/model/Dialogmodel.dart';
import 'package:open/fetures/account/prseintion/view/widget/Updatepasssword.dart';

class Bun extends StatelessWidget {
  const Bun({
    super.key,
    required this.diaModel,
  });
  final DiaModel diaModel;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            child: TextButton(
          style: TextButton.styleFrom(backgroundColor: const Color(0xffD9D9D9)),
          child: Text("show your card",
              style:
                  AppStyles.stylebold13(context).copyWith(color: Colors.black)),
          onPressed: () {
            AwesomeDialog(
              customHeader: Column(
                children: [
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                          height: 90, width: 90, child: CircleAvatar()),
                    ),
                  )
                ],
              ),
              context: context,
              dialogType: DialogType.info,
              animType: AnimType.bottomSlide,
              title: 'your card',
              desc: 'This is an example of an information dialog.',
              btnOkText: 'ok',
              body: Column(
                children: [
                  ListTile(
                    leading: Text(
                      "yourname : ",
                      style: AppStyles.stylebold16(context)
                          .copyWith(color: Color(0xff009688)),
                    ),
                    title: Text(
                      diaModel.name,
                      style: AppStyles.stylesemibold16(context)
                          .copyWith(color: Colors.black),
                    ),
                  ),
                  SizedBox(
                    height: 3,
                  ),
                  ListTile(
                    leading: Text(
                      "acdimal id : ",
                      style: AppStyles.stylebold16(context)
                          .copyWith(color: Color(0xff009688)),
                    ),
                    title: Text(
                      diaModel.id,
                      style: AppStyles.stylesemibold16(context)
                          .copyWith(color: Colors.black),
                    ),
                  ),
                  SizedBox(
                    height: 3,
                  ),
                  ListTile(
                    leading: Text(
                      "phonenamber : ",
                      style: AppStyles.stylebold16(context)
                          .copyWith(color: Color(0xff009688)),
                    ),
                    title: Text(
                      diaModel.phone,
                      style: AppStyles.stylesemibold16(context)
                          .copyWith(color: Colors.black),
                    ),
                  ),
                  SizedBox(
                    height: 3,
                  ),
                  ListTile(
                    leading: Text(
                      "email : ",
                      style: AppStyles.stylebold16(context)
                          .copyWith(color: Color(0xff009688)),
                    ),
                    title: Text(
                      diaModel.email,
                      style: AppStyles.stylesemibold16(context)
                          .copyWith(color: Colors.black),
                    ),
                  )
                ],
              ),
              btnOkOnPress: () {},
            ).show();
          },
        )),
        const SizedBox(
          width: 10,
        ),
        Expanded(
            child: TextButton(
          style: TextButton.styleFrom(backgroundColor: const Color(0xffD9D9D9)),
          child: Text("Log out",
              style:
                  AppStyles.stylebold13(context).copyWith(color: Colors.black)),
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (builder) => Updatepass()));
          },
        ))
      ],
    );
  }
}
