import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:football_app/core/utils/assets_manager.dart';
import 'package:url_launcher/url_launcher.dart';

class CarouselNewsWidget extends StatelessWidget {
  final String? imageUrl;
  final String? title;
  final String? articleUrl;
  const CarouselNewsWidget(
      {super.key, required this.imageUrl, this.title, this.articleUrl});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        final Uri url = Uri.parse(articleUrl ?? "");
        if (!await launchUrl(url)) {
          throw Exception('Could not launch $url');
        }
      },
      child: Container(
        height: 100,
        width: double.infinity,
        alignment: Alignment.bottomLeft,
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            onError: (exception, stackTrace) =>
                Image.asset(AssetsManager.assetsNotFoundImage),
            image: CachedNetworkImageProvider(
              imageUrl ?? "",
            ),
          ),
        ),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
          color: Colors.black.withOpacity(0.5),
          child: Text(
            title ?? "",
            style: Theme.of(context)
                .textTheme
                .titleLarge!
                .copyWith(fontSize: 18, fontWeight: FontWeight.w700),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
