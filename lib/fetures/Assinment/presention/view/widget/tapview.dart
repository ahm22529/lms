import 'package:flutter/material.dart';
import 'package:open/fetures/Assinment/presention/view/widget/listviewnotcompleteandcomple.dart';

class tabview extends StatefulWidget {
  const tabview({
    super.key,
    required TabController tabController,
  }) : _tabController = tabController;

  final TabController _tabController;

  @override
  State<tabview> createState() => _tabviewState();
}

class _tabviewState extends State<tabview> {
  @override
  Widget build(BuildContext context) {
    return TabBarView(
      controller: widget._tabController,
      children: const [
        Padding(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: ListviewNotComp(),
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: ListviewComp(),
        ),
      ],
    );
  }
}
