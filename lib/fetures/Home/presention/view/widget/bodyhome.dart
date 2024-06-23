import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:open/core/utiles/background.dart';
import 'package:open/fetures/Home/presention/view/widget/Appbar.dart';
import 'package:open/fetures/Home/presention/view/widget/information.dart';
import 'package:open/fetures/Home/presention/view/widget/lastnews.dart';

class BodyHome extends StatelessWidget {
  const BodyHome({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const CustomBackGround(
      chiledd: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 0.0, vertical: 5),
                  child:  CustomApbar()
                      ,
                ),
              ),
              SliverToBoxAdapter(
                child: Column(
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Information(),
                  ],
                ),
              ),
              SliverToBoxAdapter(
                child: lastnews(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
