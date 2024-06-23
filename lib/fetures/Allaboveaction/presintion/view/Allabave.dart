import 'package:flutter/material.dart';
import 'package:open/core/styel.dart';
import 'package:open/fetures/Allaboveaction/presintion/view/widget/allabovebody.dart';
import 'package:open/fetures/Courses/data/model/enroli_courses_respno/enroli_courses_respno.dart';

// ignore: camel_case_types
class AllaboveAction extends StatelessWidget {
  const AllaboveAction({super.key, required this.enroilCourses});
  final EnroliCoursesRespno enroilCourses;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Parallel Programming",
          style: AppStyles.stylebold16(context).copyWith(color: Colors.black),
        ),
        leading: Icon(Icons.keyboard_arrow_left, color: Colors.black),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20),
        child: BodyAllabove(
          enroliCoursesRespno: enroilCourses,
        ),
      ),
    );
  }
}
