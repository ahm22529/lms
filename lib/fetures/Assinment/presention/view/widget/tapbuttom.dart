import 'package:flutter/material.dart';
import 'package:open/core/styel.dart';

// ignore: camel_case_types
class tapboton extends StatelessWidget {
  const tapboton({
    super.key,
    required TabController tabController,
  }) : _tabController = tabController;

  final TabController _tabController;

  @override
  Widget build(BuildContext context) {
    return TabBar(
      controller: _tabController,
      tabs: [
        Tab(
            child: Container(
          width: 500,
          padding: const EdgeInsetsDirectional.symmetric(
              horizontal: 47, vertical: 15),
          color: const Color(0xff3B82F6),
          child: Center(
              child: Text(
            "pinding",
            style: AppStyles.stylebold15(context).copyWith(color: Colors.white),
          )),
        )),
        Tab(
            child: Container(
                width: 500,
                color: Colors.green,
                child: Center(
                    child: Text(
                  "complet",
                  style: AppStyles.stylebold15(context)
                      .copyWith(color: Colors.white),
                )))),
      ],
    );
  }
}
