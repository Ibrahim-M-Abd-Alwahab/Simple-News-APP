import 'package:flutter/material.dart';
import 'package:screeninmyapp/news_app/data/dummy_data.dart';
import 'package:screeninmyapp/news_app/views/widget/news_widget.dart';

class FavouriteScreen extends StatelessWidget {
  Function function;
  FavouriteScreen(this.function);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(15),
      child: Scaffold(
          body: ListView.builder(
        // where method used with List
        itemCount: news.where((element) => element.isLike).length,    // true تساوي  isLike فقط الاخبار يلي قيمة ال 
        itemBuilder: (context, index) {
          return NewsWidget(
              news.where((element) => element.isLike).toList()[index],
              function);
        },
      )),
    );
  }
}
// return Text(news[index].title ?? "");