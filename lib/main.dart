import 'package:app_flutter_notifications/src/providers/push_notifications_provider.dart';
import 'package:flutter/material.dart';
import 'package:app_flutter_notifications/src/pages/home_page.dart';
import 'package:app_flutter_notifications/src/pages/message_page.dart';

void main() => runApp(MyApp());
 
class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  final GlobalKey<NavigatorState> navigatorKey = new GlobalKey<NavigatorState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final pushProvider = new PushNotificationsProvider();
    pushProvider.initNotifications();

    pushProvider.messagesStream.listen((event) { 
      //print('argument main: $event');
      //Navigator.pushNamed(context, 'message');
      navigatorKey.currentState.pushNamed('message', arguments: event);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      //home: HomePage(),
      navigatorKey: navigatorKey,
      initialRoute: 'home',
      routes: {
        'home' : (BuildContext c) => HomePage(),
        'message' : (BuildContext c) => MessagePage(),
      },
    );
  }
}