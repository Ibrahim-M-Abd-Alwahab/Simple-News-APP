import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:screeninmyapp/news_app/models/new_models.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

// ignore: must_be_immutable
class NewsWidget extends StatelessWidget {
  Newsmodel newsModel;
  Function function;
  NewsWidget(this.newsModel, this.function);
  String mobileNumber = "0592504460";
  String whatsApp =
      "whatsapp://send?phone=1234&text=${Uri.encodeFull('message')}";

  shareNews() {
    Share.share(newsModel.title ?? "");
  }

  Future<void> _launchInBrowser() async {
    launchUrl(
      Uri.parse(newsModel.urlToImage ?? ""),
      mode: LaunchMode.externalApplication,
    );
  }

  @override
  Widget build(BuildContext context) {
    // you can use InkWell() insted of GestureDetector()
    return GestureDetector(
      onTap: () {
        // log(newsModel.title ?? "Not Defined");
        _launchInBrowser();
        // shareNews();
        // _makePhoneCall(mobileNumber);
        // sendMessageByWhatsAPP("972592504460", "Hello From NewsApp");
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 3),
        child: Row(
          children: [
            SizedBox(
              width: 100,
              height: 100,
              child: CachedNetworkImage(
                  imageUrl: newsModel.urlToImage ?? "",
                  fit: BoxFit.cover,
                  // progressIndicatorBuilder: , ==> في حالة بيعمل تحميل للصورة وانا حابب اضيغ صورة بتدل على انه في تحميل عندي
                  errorWidget: (x, y, z) {
                    return Image.asset(
                      "assets/images/mark.jpg",
                      fit: BoxFit.cover,
                    );
                  }),
            ),
            const SizedBox(
              width: 5,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    // news[index].title ?? "Not Defined",
                    newsModel.title ?? "",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    // news[index].description ?? "Not Defined",
                    newsModel.description ?? "",
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Row(
                    children: [
                      Expanded(child: Text(newsModel.author ?? "")),
                      IconButton(
                          onPressed: () {
                            // widget.newsModel.isLike = !widget.newsModel.isLike;
                            // setState(() {});
                            function(newsModel);
                          },
                          icon: Icon(Icons.favorite,
                              color:
                                  newsModel.isLike ? Colors.red : Colors.grey)),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
