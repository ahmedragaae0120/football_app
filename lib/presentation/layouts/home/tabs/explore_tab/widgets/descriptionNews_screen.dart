import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:football_app/core/utils/assets_manager.dart';
import 'package:football_app/data/models/news_model/Articles.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

class DescriptionScreen extends StatelessWidget {
  final Articles article;
  const DescriptionScreen({super.key, required this.article});
  @override
  Widget build(BuildContext context) {
    String formattedDate = DateFormat('yyyy-MM-dd – hh:mm')
        .format(DateTime.parse(article.publishedAt ?? ""));
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          AspectRatio(
            aspectRatio: 2 / 1,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: CachedNetworkImage(
                imageUrl: article.urlToImage ?? "",
                fit: BoxFit.fill,
                progressIndicatorBuilder: (context, url, downloadProgress) =>
                    Center(
                        child: CircularProgressIndicator(
                            value: downloadProgress.progress)),
                errorWidget: (context, url, error) => Center(
                    child: Image.asset(
                  AssetsManager.assetsNotFoundImage,
                  fit: BoxFit.cover,
                )),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    article.source?.name ?? "",
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge!
                        .copyWith(fontSize: 18),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    article.title ?? "",
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge!
                        .copyWith(fontSize: 18),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      formattedDate,
                      style: Theme.of(context)
                          .textTheme
                          .titleLarge!
                          .copyWith(fontSize: 14),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    article.description ?? "",
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge!
                        .copyWith(fontSize: 16),
                  ),
                  // const Spacer(
                  //   flex: 1,
                  // ),
                ],
              ),
            ),
          ),
          const Spacer(),
          TextButton(
            onPressed: () async {
              final Uri url = Uri.parse(article.url ?? "");
              if (!await launchUrl(url)) {
                throw Exception('Could not launch $url');
              }
            },
            child: Align(
              alignment: Alignment.centerRight,
              child: Text(
                "View Full Article....",
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(fontSize: 14),
              ),
            ),
          )
        ],
      ),
    );
  }
}
