import 'package:flutter/material.dart';

import '../../../utill/app_constants.dart';
import '../../../utill/images.dart';
import '../../../utill/styles.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Image.asset(Images.app_logo, height: 130, color: Theme.of(context).primaryColor),
          SizedBox(),
          Text(AppConstants.APP_NAME,
              textAlign: TextAlign.center,
              style: poppinsMedium.copyWith(
                color: Theme.of(context).primaryColor,
                fontSize: 30,
              )),
          SizedBox(height:20),
          Text("version: 0.0.1.2",
              textAlign: TextAlign.center,
              style: poppinsMedium.copyWith(
                color: Theme.of(context).primaryColor,
                fontSize: 15,
              )),
        ],
      ),
    );
  }
}
