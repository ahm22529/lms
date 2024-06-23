import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:open/fetures/account/data/Repo/AcccountRep.dart';
import 'package:open/fetures/account/data/Repo/RepoImp.dart';
import 'package:open/fetures/account/prseintion/manager/Account/account_cubit.dart';
import 'package:open/fetures/account/prseintion/view/widget/bodyaccount.dart';

class Account extends StatefulWidget {
  const Account({super.key});

  @override
  State<Account> createState() => _AccountState();
}

class _AccountState extends State<Account> {
  AccRepo acc = AccountRepoImp();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AccountCubit(acc: acc),
      child: const Scaffold(
        body: BodyAccount(),
      ),
    );
  }
}
