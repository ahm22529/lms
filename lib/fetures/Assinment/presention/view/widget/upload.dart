import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:open/core/styel.dart';
import 'package:open/fetures/Assinment/data/model/task_model_response/task_model_response.dart';
import 'package:open/fetures/Assinment/presention/view/widget/headerupload.dart';
import 'package:open/fetures/Assinment/presention/view/widget/typefile.dart';

import '../../manager/cubit/upload_cubit.dart';

class Bodyupload extends StatefulWidget {
  const Bodyupload({super.key, required this.response});
  final TaskModelResponse response;
  @override
  State<Bodyupload> createState() => _BodyuploadState();
}

class _BodyuploadState extends State<Bodyupload> {
  String path = "";
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HeaderUpload(
            response: widget.response,
          ),
          const Spacer(),
          const typefile(),
          BlocListener<UploadCubit, UploadState>(
            listener: (context, state) {
              if (state is Uploadfailuer) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Center(
                        child: Text(state.errmas,
                            style: AppStyles.styleMedium14(context)
                                .copyWith(color: Colors.white))),
                    backgroundColor: Colors.blue,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16)),
                  ),
                );
              } else if (state is Uploadsucess) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Center(
                        child: Text(state.mass,
                            style: AppStyles.styleMedium14(context)
                                .copyWith(color: Colors.white))),
                    backgroundColor: Colors.blue,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16)),
                  ),
                );
              }
            },
            child: Text(
              path,
              style: AppStyles.stylesemibold16(context)
                  .copyWith(color: Colors.black),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: TextButton(
                    onPressed: () async {
                      FilePickerResult? result =
                          await FilePicker.platform.pickFiles();

                      if (result != null) {
                        String? filePath = result.files.single.path;

                        if (filePath != null) {
                          // قم بتغيير المسار هنا بناء على الاحتياجات
                          String updatedPath = filePath;

                          setState(() {
                            path = updatedPath;
                          });

                          print('Path of picked file: $updatedPath');

                          // قم بإرسال الملف إلى الخادم باستخدام المسار المحدث
                          // ignore: use_build_context_synchronously
                          BlocProvider.of<UploadCubit>(context).uploadAssin(
                              updatedPath,
                              "Students/File/Upload?taskid=${widget.response.taskId}");
                        }
                      } else {
                        // لم يتم اختيار أي ملف
                      }
                    },
                    style: TextButton.styleFrom(
                        backgroundColor: const Color(0xff2295EF)),
                    child: Text(
                      "upload",
                      style: AppStyles.stylebold20(context)
                          .copyWith(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
