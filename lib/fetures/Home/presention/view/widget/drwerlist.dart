import 'package:flutter/material.dart';
import 'package:open/fetures/Home/presention/view/widget/iteamdrwer.dart';

class drweriteamListview extends StatefulWidget {
  const drweriteamListview({
    super.key,
    // ignore: non_constant_identifier_names
    required this.Iteam,
  });

  final List Iteam;

  @override
  State<drweriteamListview> createState() => _drweriteamListviewState();
}

class _drweriteamListviewState extends State<drweriteamListview> {
  int active = 0;
  @override
  Widget build(BuildContext context) {
    return SliverList.builder(
        itemCount: widget.Iteam.length,
        itemBuilder: (context, index) => GestureDetector(
            onTap: () {
              if (active != index) {
                setState(() {
                  active = index;
                  print(active);
                });
              }
            },
            child: IteamDrwer(
              model: widget.Iteam[index],
              isactive: active == index,
            )));
  }
}
