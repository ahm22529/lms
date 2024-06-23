import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:open/core/styel.dart';
import 'package:open/fetures/Assinment/data/model/task_model_response/task_model_response.dart';
import 'package:open/fetures/Assinment/data/repo/AssimentRepImp.dart';
import 'package:open/fetures/Assinment/data/repo/AssinmeRepo.dart';
import 'package:open/fetures/Assinment/presention/view/widget/upload.dart';

import '../manager/cubit/upload_cubit.dart';

// ignore: camel_case_types
class upload extends StatefulWidget {
  const upload({super.key, required this.response});
  final TaskModelResponse response;

  @override
  State<upload> createState() => _uploadState();
}

// ignore: camel_case_types
class _uploadState extends State<upload> {
  AssinmetRepo assinmentREpo = AssinmentREpoImp();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        return UploadCubit(assinmentREpo: assinmentREpo);
      },
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "Parallel Programming",
            style: AppStyles.stylebold16(context).copyWith(color: Colors.black),
          ),
          leading: const Icon(Icons.keyboard_arrow_left, color: Colors.black),
        ),
        body: Bodyupload(
          response: widget.response,
        ),
      ),
    );
  }
}
