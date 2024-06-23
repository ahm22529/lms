import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:open/fetures/Home/data/Model/news/news.dart';
import 'package:open/fetures/Home/presention/cubit/news_cubit.dart';
import 'package:open/fetures/Home/presention/view/widget/Iteamnewa.dart';

// ignore: camel_case_types
class lastnews extends StatefulWidget {
  const lastnews({
    super.key,
  });

  @override
  State<lastnews> createState() => _lastnewsState();
}

class _lastnewsState extends State<lastnews> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewsCubit, NewsState>(
      builder: (context, state) {
        return ListView.builder(
            itemCount: 2,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (BuildContext context, int index) => Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Iteamnews(
                    news: state is Newssucess ? state.news[index] : News(),
                  ),
                ));
      },
    );
  }
}
