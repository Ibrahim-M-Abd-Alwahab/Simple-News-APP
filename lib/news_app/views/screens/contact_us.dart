import 'package:flutter/material.dart';
import 'package:screeninmyapp/news_app/models/new_models.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactUs extends StatefulWidget {
  @override
  State<ContactUs> createState() => _ContactUsState();
}

class _ContactUsState extends State<ContactUs> {
  String whatsApp =
      "whatsapp://send?phone=1234&text=${Uri.encodeFull('message')}";
  var instagramUrl = 'https://www.instagram.com/ibrahim1mohammed/';

  sendMessageByWhatsAPP(String phone, String message) {
    String url = "whatsapp://send?phone=$phone&text=${Uri.encodeFull(message)}";
    launchUrl(Uri.parse(url));
  }

  sendMessageByPhoneNumber(String phoneNumber) async {
    Uri uri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    launchUrl(uri);
  }

  sendMessageBySmS(String phoneNumber) async {
    Uri uri = Uri(
      scheme: 'sms',
      path: "0592504460",
    );
    launchUrl(uri);
  }

  sendMessageByEmail(String phoneNumber) async {
    Uri uri = Uri(
      scheme: 'mailto',
      path: "ibrabim1@gmail.com",
    );
    launchUrl(uri);
  }

  sendMessageByInstagram() async {
    launchUrl(
      Uri.parse(instagramUrl),
      mode: LaunchMode.externalApplication,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Container(
        padding: EdgeInsets.all(50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            const Text(
              "Contact Us",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                  onPressed: () {
                    sendMessageByWhatsAPP("972597114525", "Hello From NewsApp");
                  },
                  icon:
                      const Icon(Icons.whatsapp, size: 40, color: Colors.green),
                ),
                IconButton(
                  onPressed: () {
                    sendMessageByPhoneNumber("972597114525");
                  },
                  icon: const Icon(Icons.phone, size: 40, color: Colors.blue),
                ),
                IconButton(
                  onPressed: () {
                    sendMessageBySmS("972597114525");
                  },
                  icon: const Icon(Icons.sms, size: 40, color: Colors.orange),
                ),
                IconButton(
                  onPressed: () {
                    sendMessageByEmail("972597114525");
                  },
                  icon: const Icon(Icons.email, size: 40, color: Colors.red),
                ),
                IconButton(
                  onPressed: () {
                    // sendMessageByEmail("972597114525");
                    sendMessageByInstagram();
                  },
                  icon: Image.asset('assets/icons/instagram.png'),
                ),
              ],
            )
          ],
        ),
      ),
    ));
  }
}
