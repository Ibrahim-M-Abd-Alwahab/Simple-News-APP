import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:screeninmyapp/news_app/data/dummy_data.dart';
import 'package:screeninmyapp/news_app/views/widget/news_widget.dart';

// ignore: must_be_immutable
class AllNewsScreen extends StatelessWidget {
  Function function;
  // ignore: use_key_in_widget_constructors
  AllNewsScreen(this.function);
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: news.length,
      itemBuilder: (context, index) {
        // return Text(news[index].title ?? "");    // list of Text
        return NewsWidget(news[index], function);   // list of Widget
      },
    );
  }
}
