// Copyright 2018 Google LLC
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//      http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

// import 'package:example_flutter/photo.dart';
// import 'package:example_flutter/spam.dart';
// import 'package:example_flutter/swipe.dart';
// import 'package:example_flutter/trash.dart';
import 'package:flutter/foundation.dart'
    show debugDefaultTargetPlatformOverride;
import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';

import 'home.dart';
import 'hero.dart';

import 'package:flutter/services.dart';

import 'index.dart';
import 'spam.dart';
import 'trash.dart';

void main() {
  // See https://github.com/flutter/flutter/wiki/Desktop-shells#target-platform-override
  debugDefaultTargetPlatformOverride = TargetPlatform.fuchsia;
  // var app = MaterialApp(home: HeroAnimation(),);
  // runApp(app);

  runApp(MaterialApp(
    home: MySplash(),
  ));
}

class MySplash extends StatefulWidget{
  @override
  _MySplashState createState() => _MySplashState();
}

class _MySplashState extends State<MySplash> {
  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      seconds: 5,
      navigateAfterSeconds: MyApp(),
      image: Image.asset(
        'assets/launcher/logo.png',
        width: 120,
        height: 120,
      ),
      loadingText: Text(
        'WELCOME TO FASTMAIL',
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w700,
          fontSize: 20,
        ),
      ),
      backgroundColor: Colors.red,
      styleTextUnderTheLoader: TextStyle(),
      photoSize: 100.0,
      onClick: ()=>print("Flutter Egypt"),
      loaderColor: Colors.yellow,
    );
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fast Mail',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: MyHomePage(title: 'Inbox'),
      // home: Index(),
      // home: MySwipe(),
      routes: {
        '/home-page': (context) => Index(),
        '/spam-page': (context) => Spam(),
        '/trash-page': (context) => Trash(),
      },
    );
  }
}