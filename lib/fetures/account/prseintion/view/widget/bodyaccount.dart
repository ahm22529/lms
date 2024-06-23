import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:open/core/utiles/background.dart';
import 'package:open/fetures/Home/presention/view/widget/Appbar.dart';
import 'package:open/fetures/account/data/model/Dialogmodel.dart';
import 'package:open/fetures/account/prseintion/manager/Account/account_cubit.dart';

import 'package:open/fetures/account/prseintion/view/widget/buttom.dart';
import 'package:open/fetures/account/prseintion/view/widget/changepass.dart';
import 'package:open/fetures/account/prseintion/view/widget/info.dart';

class BodyAccount extends StatefulWidget {
  const BodyAccount({super.key});

  @override
  State<BodyAccount> createState() => _BodyAccountState();
}

class _BodyAccountState extends State<BodyAccount> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    BlocProvider.of<AccountCubit>(context)
        .getcourses("Students/GetStudentInfo");
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AccountCubit, AccountState>(
      builder: (context, state) {
        if (state is Accountsucess) {
          return CustomBackGround(
            chiledd: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                children: [
                  const SafeArea(child: CustomApbar()),
                  SizedBox(
                    height: 10,
                  ),
                  const Info(),
                  SizedBox(
                    height: 20,
                  ),
                  Bun(
                    diaModel: DiaModel(
                        name: state.Info.fullName!,
                        phone: state.Info.phone!,
                        id: state.Info.academicId!,
                        email: state.Info.email!),
                  ),
                  const changepass(),
                ],
              ),
            ),
          );
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
