import 'package:flutter/cupertino.dart';
import 'package:open/fetures/Courses/data/model/enroli_courses_respno/enroli_courses_respno.dart';
import 'package:open/fetures/Courses/presention/view/widget/listtitelenroil.dart';

class iteamenroilcourses extends StatelessWidget {
  const iteamenroilcourses({
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
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: Color(0xff009688))),
      child: listtielenroilcourses(
        image: image,
        name: name,
        inst: inst,
        enroliCoursesRespno: enroliCoursesRespno,
      ),
    );
  }
}
