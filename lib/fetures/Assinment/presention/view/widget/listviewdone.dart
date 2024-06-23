import 'package:flutter/cupertino.dart';
import 'package:open/fetures/Assinment/data/model/listtielmodel.dart';
import 'package:open/fetures/Assinment/presention/view/widget/doneiteam.dart';

class ListViewDone extends StatefulWidget {
  const ListViewDone({super.key});

  @override
  State<ListViewDone> createState() => _ListViewDoneState();
}

class _ListViewDoneState extends State<ListViewDone> {
// ignore: camel_case_types, non_constant_identifier_names
  List Ro = [
    Listtielmodel(imgage: 'imgage', titel: 'Done 4 task today'),
    Listtielmodel(imgage: 'imgage', titel: 'Done 4 task today'),
    Listtielmodel(imgage: 'imgage', titel: 'Done 4 task today')
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: Ro.map((e) => const done()).toList(),
    );
  }
}
