import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:open/core/styel.dart';
import 'package:open/fetures/grad/data/Repo/Repo.dart';
import 'package:open/fetures/grad/data/Repo/RepoImp.dart';
import 'package:open/fetures/grad/prsention/manager/cubit/grad_cubit.dart';
import 'package:open/fetures/grad/prsention/view/bodygraid.dart';

class Grad extends StatefulWidget {
  const Grad({super.key, required this.cid});
  final String cid;
  @override
  State<Grad> createState() => _GradState();
}

class _GradState extends State<Grad> {
  GradRepo gradRepo = GredREpoImp();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GradCubit(gradRepo: gradRepo),
      child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text(
              "Parallel Programming",
              style:
                  AppStyles.stylebold16(context).copyWith(color: Colors.black),
            ),
            leading: const Icon(Icons.keyboard_arrow_left, color: Colors.black),
          ),
          body: bodyGrad(
            cid: widget.cid,
          )),
    );
  }
}
