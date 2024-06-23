import 'package:flutter/cupertino.dart';
import 'package:open/fetures/Assinment/presention/view/widget/bodycontinerdone.dart';

class BodySliverDpone extends StatelessWidget {
  const BodySliverDpone({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [
          const Color(0xff223CC2),
          const Color(0xff1C40FF).withOpacity(.6)
        ]),
        borderRadius: BorderRadius.circular(18),
      ),
      child: const BodCondone(),
    );
  }
}
