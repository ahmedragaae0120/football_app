import 'package:flutter/material.dart';
import 'package:football_app/presentation/layouts/home/tabs/explore_tab/widgets/article_widget.dart';

class ArticleListviewSeparated extends StatelessWidget {
  final List list;
  final ScrollController? controller;
  const ArticleListviewSeparated(
      {super.key, required this.list, this.controller});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      controller: controller,
      itemBuilder: (context, index) => ArticleWidget(article: list[index]),
      itemCount: list.length,
      separatorBuilder: (BuildContext context, int index) => const SizedBox(
        height: 20,
      ),
    );
  }
}
