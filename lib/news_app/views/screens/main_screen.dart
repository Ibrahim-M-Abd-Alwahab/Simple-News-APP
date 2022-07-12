import 'package:flutter/material.dart';
import 'package:screeninmyapp/news_app/models/new_models.dart';
import 'package:screeninmyapp/news_app/data/dummy_data.dart';
import 'package:screeninmyapp/news_app/views/screens/all_news_screen.dart';
import 'package:screeninmyapp/news_app/views/screens/contact_us.dart';
import 'package:screeninmyapp/news_app/views/screens/favourite_screen.dart';

class MainScreen extends StatefulWidget {
  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  likeNews(Newsmodel newsmodel) {
    int index = news.indexOf(newsmodel); // جبت الاندكس تاعت الاخبار كلها
    news[index].isLike = !news[index].isLike; // غيرت في الاز لايك الموجودة
    // newsmodel.isLike = !newsmodel.isLike ==> هاد السطر هيعدل على كل الاخبار الموجودة عندي لازززم احدد الاندكس
    setState(() {});
    // (الشاشة مرتبطة بالداتا والعكس) الموجود على الشاشة widget مباشرة يتم اسقاطه على ال  data مفترض اي تعديل بصير على ال
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("News App"),
          bottom: const TabBar(tabs: [
            Tab(text: "All News"),
            Tab(text: "Favourite"),
            Tab(text: "Contact Us"),
          ]),
        ),
        body: TabBarView(children: [
          AllNewsScreen(likeNews),
          FavouriteScreen(likeNews),
          ContactUs(),
        ]),
      ),
    );
  }
}
