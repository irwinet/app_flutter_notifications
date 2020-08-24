import 'package:flutter/material.dart';
import 'package:app_flutter_notifications/pages/home_page.dart';
import 'package:app_flutter_notifications/pages/message_page.dart';

void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      //home: HomePage(),
      initialRoute: 'home',
      routes: {
        'home' : (BuildContext c) => HomePage(),
        'message' : (BuildContext c) => MessagePage(),
      },
    );
  }
}