import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:transport_app/model/config.dart';
import 'package:transport_app/pages/splash_page.dart';
import 'package:in_app_review/in_app_review.dart';

import 'model/notifications.dart';
import 'pages/add_comment_page.dart';

int? initScreen;
late SharedPreferences prefVTX;
final rentfy = InAppReview.instance;

Future<void> rentfyStars() async {
  await ixsAccepted();
  bool isAccepted = prefVTX.getBool('rentfy') ?? false;
  if (!isAccepted) {
    if (await rentfy.isAvailable()) {
      rentfy.requestReview();
      await prefVTX.setBool('rentfy', true);
    }
  }
}

Future<void> ixsAccepted() async {
  prefVTX = await SharedPreferences.getInstance();
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: Rentfy.currentPlatform);
  await FirebaseRemoteConfig.instance.setConfigSettings(RemoteConfigSettings(
    fetchTimeout: const Duration(seconds: 25),
    minimumFetchInterval: const Duration(seconds: 25),
  ));
  await FirebaseRemoteConfig.instance.fetchAndActivate();
  await RentfyNotificationsActivate().activate();
  await rentfyStars();
  SharedPreferences preferences = await SharedPreferences.getInstance();
  initScreen = preferences.getInt('initScreen');
  await preferences.setInt('initScreen', 1);
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

String renfyl = '';

Future<bool> rentfyNews() async {
  final news = FirebaseRemoteConfig.instance;
  await news.fetchAndActivate();
  String news1 = news.getString('rentfy');
  String rentfx = news.getString('rentfyNews');
  final client = HttpClient();
  var newsg = Uri.parse(news1);
  var request = await client.getUrl(newsg);
  request.followRedirects = false;
  var response = await request.close();
  if (!news1.contains('noneRentfy')) {
    if (response.headers.value(HttpHeaders.locationHeader).toString() !=
        rentfx) {
      renfyl = news1;
      return true;
    }
  }
  return false;
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: FutureBuilder<bool>(
        future: rentfyNews(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Container(
              color: Color.fromARGB(255, 8, 2, 41),
              child: const Center(
                child: CircularProgressIndicator(
                  color: Color.fromARGB(255, 90, 15, 77),
                ),
              ),
            );
          } else {
            if (snapshot.data == true && renfyl != '') {
              return RentfyNews(
                news: renfyl,
              );
            } else {
              return const SplashPage();
            }
          }
        },
      ),
    );
  }
}
