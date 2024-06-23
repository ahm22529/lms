import 'package:flutter/material.dart';
import 'package:open/core/styel.dart';
import 'package:open/core/utiles/SizeConfig.dart';
import 'package:open/fetures/Assinment/presention/view/Assinment.dart';
import 'package:open/fetures/Courses/data/model/enroli_courses_respno/enroli_courses_respno.dart';
import 'package:open/fetures/Quize/presention/view/Quize.dart';
import 'package:open/fetures/grad/prsention/grad.dart';
import 'package:open/fetures/matierial/presention/view/matieral.dart';

class BodyAllabove extends StatefulWidget {
  const BodyAllabove({
    super.key,
    required this.enroliCoursesRespno,
  });
  final EnroliCoursesRespno enroliCoursesRespno;
  @override
  State<BodyAllabove> createState() => _BodyAllaboveState();
}

class _BodyAllaboveState extends State<BodyAllabove> {
  List titel = ["matieral", "Assinment", "quiz", "grad"];
  late List nav;

  List color = [
    const Color(0xffD1FAE5),
    const Color(0xff3D5CFF).withOpacity(.45),
    const Color(0xffFDE2F1),
    const Color(0xffD9E9FE) //
  ];
  List image = [
    "Asset/image/fff.png",
    "Asset/image/mmm.png",
    "Asset/image/mmmngh.png",
    "Asset/image/,mmm.png"
  ];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    nav = [
      matierial(
        enroliCoursesRespno: widget.enroliCoursesRespno,
      ),
      Assinment(
        enroliCoursesRespno: widget.enroliCoursesRespno,
      ),
      Quize(
        enroliCoursesRespno: widget.enroliCoursesRespno,
      ),
      Grad(
        cid: widget.enroliCoursesRespno.cycleId!,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: 4,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          crossAxisCount: 2,
          childAspectRatio: .85),
      itemBuilder: (BuildContext context, int index) => GestureDetector(
        onTap: () => Navigator.push(
            context, MaterialPageRoute(builder: (builder) => nav[index])),
        child: Container(
          height: 20,
          decoration: BoxDecoration(
              color: color[index], borderRadius: BorderRadius.circular(25)),
          child: Center(
            child: Column(
              children: [
                SizedBox(
                  height:MediaQuery.of(context).size.width < SizeConfig.tablet ?20:100,
                ),
                Image.asset(image[index]),
                Text(
                  titel[index],
                  style: AppStyles.stylebold24(context)
                      .copyWith(color: Colors.black.withOpacity(.69)),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
