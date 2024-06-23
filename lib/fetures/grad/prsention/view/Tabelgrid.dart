import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:open/core/styel.dart';
import 'package:open/fetures/grad/prsention/manager/cubit/grad_cubit.dart';

class tabelgrad extends StatelessWidget {
  const tabelgrad({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GradCubit, GradState>(
      builder: (context, state) {
        if (state is Gradsucess) {
          // قائمة تحتوي على الصفوف التي تريد عرضها
          List<DataRow> rows = [];

          // تكرار كل عنصر في قائمة state.grads وإضافة صف لكل منها
          state.grad.forEach((rowData) {
            DataRow row = DataRow(
              color: MaterialStateColor.resolveWith(
                (states) => Colors.transparent,
              ),
              cells: [
                DataCell(
                  Center(
                    child: Text(
                      rowData.title!,
                      style: AppStyles.stylebold20(context)
                          .copyWith(color: Colors.black),
                    ),
                  ),
                ),
                DataCell(
                  Center(
                    child: Text(
                      rowData.grade.toString()!,
                      style: AppStyles.stylebold20(context)
                          .copyWith(color: const Color(0xff009688)),
                    ),
                  ),
                ),
              ],
            );
            rows.add(row); // إضافة الصف إلى القائمة
          });

          // استخدام القائمة من الصفوف لبناء DataTable
          return DataTable(
            dividerThickness: 2,
            border: TableBorder.symmetric(
              outside: const BorderSide(color: Colors.transparent),
              inside: const BorderSide(color: Color(0xff009688)),
            ),
            columns: [
              DataColumn(
                label: Text("Task", style: AppStyles.stylesemibold20(context)),
              ),
              DataColumn(
                label: Container(
                  width: MediaQuery.of(context).size.width * 0.35,
                  child: Center(
                    child:
                        Text("mark", style: AppStyles.stylesemibold20(context)),
                  ),
                ),
              ),
            ],
            rows: rows, // استخدام القائمة من الصفوف
          );
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
