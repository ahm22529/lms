import 'package:flutter/material.dart';
import 'package:icons_flutter/icons_flutter.dart';
import 'package:open/core/styel.dart';
import 'package:open/fetures/Home/data/Model/modelIcon.dart';
import 'package:open/fetures/Home/presention/view/widget/drwerlist.dart';

class BodyContiner extends StatefulWidget {
  const BodyContiner({super.key});

  @override
  State<BodyContiner> createState() => _BodyContinerState();
}

class _BodyContinerState extends State<BodyContiner> {
  // ignore: non_constant_identifier_names
  List Iteam = [
    drawermodel(data: "eitacount", image: const Icon(FontAwesome5.user)),
    drawermodel(data: "data", image: const Icon(FontAwesome5.envelope)),
    drawermodel(
        data: "log ou", image: const Icon(FontAwesome5.font_awesome_logo_full))
  ];

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * .02,
              ),
              const SizedBox(height: 91, width: 91, child: CircleAvatar()),
              Text(
                "Hi Ahmed",
                style: AppStyles.stylebold20(context)
                    .copyWith(color: Colors.black),
              ),
              const SizedBox(
                height: 12,
              ),
              const Divider(
                height: 20,
              )
            ],
          ),
        ),
        drweriteamListview(Iteam: Iteam),
        const SliverFillRemaining(
          hasScrollBody: false,
          child: Column(
            children: [
              Expanded(
                  child: SizedBox(
                height: 20,
              )),
            ],
          ),
        )
      ],
    );
  }
}
