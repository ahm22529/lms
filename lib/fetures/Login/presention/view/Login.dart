import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:open/fetures/Login/data/repo/Loginrepo.dart';
import 'package:open/fetures/Login/data/repo/loginrepoimp.dart';
import 'package:open/fetures/Login/presention/manger/cubit/login_cubit.dart';
import 'package:open/fetures/Login/presention/view/widget/bodylogin.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final LoginRepo loginRepo = LoginRepoImp();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocProvider(
            create: (context) => LoginCubit(loginRepo: loginRepo),
            child: BodyLoginpage()));
  }
}
