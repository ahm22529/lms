import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:open/core/styel.dart';
import 'package:open/fetures/Login/presention/manger/cubit/login_cubit.dart';

class SininButom extends StatelessWidget {
  const SininButom({
    super.key,
    this.onPressed,
  });
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      builder: (context, state) {
        return Row(
          children: [
            Expanded(
                child: TextButton(
              onPressed: onPressed,
              style: TextButton.styleFrom(backgroundColor: Color(0xff2295EF)),
              child: state is Loginloading
                  ? const Center(child: CircularProgressIndicator())
                  : Text(
                      "Sing in",
                      style: AppStyles.stylesemibold30(context)
                          .copyWith(color: Colors.white),
                    ),
            ))
          ],
        );
      },
    );
  }
}
