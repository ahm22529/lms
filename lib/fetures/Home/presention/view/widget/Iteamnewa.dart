import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:open/core/styel.dart';
import 'package:open/fetures/Home/data/Model/news/news.dart';

class Iteamnews extends StatelessWidget {
  const Iteamnews({
    super.key,
    required this.news,
  });
  final News news;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
        border: Border.all(color: const Color(0xff000000).withOpacity(.27)),
      ),
      child: Bodynewsiteam(
        news: news,
      ),
    );
  }
}

class Bodynewsiteam extends StatelessWidget {
  const Bodynewsiteam({
    super.key,
    required this.news,
  });
  final News news;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Column(
            children: [
              Headernews(
                news: news,
              ),
              Divider(
                height: 5,
              )
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            news.content!,
            style: AppStyles.styleRegular12(context)
                .copyWith(color: const Color(0xff858597)),
          ),
          const SizedBox(
            height: 10,
          ),
          Center(child: Image.network(news.filePath ??"")),
          const SizedBox(
            height: 5,
          )
        ],
      ),
    );
  }
}

class Headernews extends StatelessWidget {
  const Headernews({
    super.key,
    required this.news,
  });
  final News news;
  @override
  Widget build(BuildContext context) {
    return ListTile(
        leading: SizedBox(
            height: 50,
            width: 50,
            child: CircleAvatar(
              backgroundImage: NetworkImage(news.userImage!),
            )),
        title: Row(
          children: [
            Text(
              news.userName!,
              style: AppStyles.stylebold15(context),
            ),
            SvgPicture.asset('Asset/image/Approval.svg')
          ],
        ),
        subtitle: Text(
          news.createdAt!.toLocal().toString()!,
          style: AppStyles.styleRegular14(context)
              .copyWith(color: const Color(0xff1F1F39)),
        ),
        trailing: const Icon(Icons.list));
  }
}
