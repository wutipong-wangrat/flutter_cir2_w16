import 'dart:async';

import 'package:flutter/material.dart';
import 'home.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 2), () {
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => HomeScreen()));
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Hi I oam',style: TextStyle(fontSize: 30,color: Colors.white),),
            Image.network(
              "data:image/png;base64,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",
              height: 200,
              width: double.infinity,
            ),
            SizedBox(height: 20),
            CircularProgressIndicator.adaptive(
              valueColor: AlwaysStoppedAnimation(Colors.white),
            )
          ],
        ),
      ),
    );
  }
}

