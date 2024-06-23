import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:open/fetures/account/prseintion/manager/Account/account_cubit.dart';
import 'package:open/fetures/account/prseintion/view/widget/Iteaminfi.dart';

class Info extends StatelessWidget {
  const Info({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AccountCubit, AccountState>(
      builder: (context, state) {
        if (state is Accountsucess) {
          return Row(
            children: [
              SizedBox(
                width: 75,
                height: 80,
                child: CircleAvatar(
                  backgroundColor: Colors.indigoAccent,
                  backgroundImage: NetworkImage(state.Info.imagePath!),
                ),
              ),
              const SizedBox(
                width: 30,
              ),
              Flexible(
                child: FittedBox(
                  child: Row(
                    children: [
                      columiteam(
                          str1: state.Info.departmentName!, str2: "deperment"),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * .3,
                      ),
                      columiteam(
                          str1: state.Info.level.toString(), str2: "level"),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * .3,
                      ),
                      columiteam(
                          str1: state.Info.facultyName!, str2: "facultyName"),
                    ],
                  ),
                ),
              ),
            ],
          );
        } else if (state is Accountfauiler) {
          return Text(state.errmass);
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
