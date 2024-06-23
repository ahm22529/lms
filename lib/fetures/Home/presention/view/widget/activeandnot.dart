import 'package:flutter/material.dart';
import 'package:open/core/styel.dart';

class Active extends StatelessWidget {
  const Active({super.key, required this.titel, required this.icon});
  final String titel;
  final Icon icon;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: const Color(0xff3B82F6),
          borderRadius: BorderRadius.circular(12)),
      child: Row(
        children: [
          icon,
          const SizedBox(
            width: 10,
          ),
          Text(
            titel,
            style:
                AppStyles.styleMedium14(context).copyWith(color: Colors.white),
          )
        ],
      ),
    );
  }
}

class NotActive extends StatelessWidget {
  const NotActive({super.key, required this.icon, required this.titel});
  final Icon icon;
  final String titel;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(12)),
      child: Row(
        children: [
          icon,
          const SizedBox(
            width: 10,
          ),
          Text(
            titel,
            style:
                AppStyles.styleMedium14(context).copyWith(color: Colors.black),
          )
        ],
      ),
    );
  }
}
