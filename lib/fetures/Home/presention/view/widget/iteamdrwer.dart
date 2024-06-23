import 'package:flutter/material.dart';
import 'package:open/fetures/Home/data/Model/modelIcon.dart';

import 'activeandnot.dart';

class IteamDrwer extends StatelessWidget {
  const IteamDrwer({super.key, required this.model, required this.isactive});
  final drawermodel model;
  final bool isactive;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: isactive
          ? Active(
              titel: model.data,
              icon: model.image,
            )
          : NotActive(
              icon: model.image,
              titel: model.data,
            ),
    );
  }
}
