import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:warehouse/helper/notifications_healper.dart';
import 'package:warehouse/view/screens/splash/splash_screen.dart';
import 'package:warehouse/view/screens/auth/login_screen.dart';

void main() {
  runApp(
    MultiProvider(
        providers: [
          ChangeNotifierProvider<SingleNotifier>(create: (_) => SingleNotifier(), )
        ],
    child: MyApp(),
    )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginScreen(),
    );
  }
}

