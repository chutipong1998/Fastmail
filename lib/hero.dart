import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

import 'photo.dart';

class HeroAnimation extends StatelessWidget {
  // double timeDilation;

  final color = [Colors.brown, Colors.blue, Colors.pink, Colors.purple, Colors.red];

  Widget build(BuildContext context) {
    timeDilation = 2.0; // 1.0 means normal animation speed.

    return Scaffold(
      appBar: AppBar(
        title: const Text('Basic Hero Animation'),
      ),
      body: ListView(
        children: <Widget>[
          AnimateHero(context, 'assets/launcher/email.png'),
          AnimateHero(context, 'assets/launcher/logo.png'),
        ],
      ),
    );
  }
}

Widget AnimateHero(BuildContext context, String image){
  final color = [Colors.brown, Colors.blue, Colors.pink, Colors.purple, Colors.red];
  return Center(
    child: PhotoHero(
      // photo: CircleAvatar(
      //   backgroundColor: Colors.brown,
      //   child: Text(
      //     'CCCCC'.substring(0,1),
      //     style: TextStyle(
      //       fontSize: 25,
      //       color: Colors.white,
      //     ),
      //   ),
      // ),
      photo: image,
      width: 300.0,
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute<void>(
          builder: (BuildContext context) {
            return Scaffold(
              appBar: AppBar(
                title: const Text('Flippers Page'),
              ),
              body: Container(
                // The blue background emphasizes that it's a new route.
                color: Colors.lightBlueAccent,
                padding: const EdgeInsets.all(16.0),
                alignment: Alignment.topLeft,
                child: PhotoHero(
                  photo: image,
                  width: 100.0,
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  // backgroundColor: Colors.brown,
                  // child: PhotoHero(
                  //   photo: image,
                  //   width: 100.0,
                  //   onTap: () {
                  //     Navigator.of(context).pop();
                  //   },
                  // ),
                // ),
                  // photo: CircleAvatar(
                  //   backgroundColor: Colors.brown,
                  //   child: Text(
                  //     'CCCCC'.substring(0,1),
                  //     style: TextStyle(
                  //       fontSize: 25,
                  //       color: Colors.white,
                  //     ),
                  //   ),
                  // ),
                  // width: 100.0,
                  // onTap: () {
                  //   Navigator.of(context).pop();
                  // },
                ),
              ),
            );
          }
        ));
      },
    ),
  );
}
