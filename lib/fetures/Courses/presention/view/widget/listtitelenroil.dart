import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:open/core/styel.dart';
import 'package:open/fetures/Allaboveaction/presintion/view/Allabave.dart';
import 'package:open/fetures/Courses/data/model/enroli_courses_respno/enroli_courses_respno.dart';

// ignore: camel_case_types
class listtielenroilcourses extends StatelessWidget {
  const listtielenroilcourses({
    super.key,
    required this.image,
    required this.name,
    required this.inst,
    required this.enroliCoursesRespno,
  });
  final String image, name, inst;
  final EnroliCoursesRespno enroliCoursesRespno;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(backgroundImage: NetworkImage(image)),
      title: Text(
        name,
        style: AppStyles.styleMedium14(context),
      ),
      subtitle: Text(
        inst,
        style: AppStyles.styleRegular10(context),
      ),
      trailing: GestureDetector(
          onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (builder) => AllaboveAction(
                        enroilCourses: enroliCoursesRespno,
                      ))),
          child: SvgPicture.asset("Asset/image/next.svg")),
    );
  }
}
