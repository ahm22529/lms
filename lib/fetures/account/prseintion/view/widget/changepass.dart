import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:open/core/styel.dart';

class changepass extends StatelessWidget {
  const changepass({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        "Change Password",
        style: AppStyles.stylebold13(context),
      ),
      leading: const Icon(
        Icons.lock,
        color: Colors.black,
      ),
      trailing: const CircleAvatar(
          backgroundColor: Colors.black,
          child: Center(
              child: Icon(
            Icons.keyboard_arrow_right_outlined,
            color: Colors.white,
          ))),
    );
  }
}
