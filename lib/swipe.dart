import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class MySwipe extends StatefulWidget {
  MySwipe({Key key}) : super(key: key);

  @override
  MyAppState createState() {
    return MyAppState();
  }
}

class MyAppState extends State<MySwipe> {
  final items = List<String>.generate(20, (i) => "Item ${i + 1}");

  final List<String> name = [
    'Discord',
    'Firefox',
    'Github',
    'Adison',
    'Rapidminer',
    'Nike',
    'Matt at Ionic'
  ];

  final List<String> topic = [
    'You missed messages in nonnnnnnn ',
    'Sign-in code for Firefox',
    '[GitHub] Please reset your password',
    'Competition Recap: NFL Big Data Bowl',
    '[Last Chance] RapidMiner Virtual Optimizer Webinar',
    'New Product: Air Force 1 React',
    'Build Your First Ionic App'
  ];

  final List<String> des = [
    'Want push notifications instead?\nDownload Discord on your phone to keep chatting while AFK, or turn off these notifications now.',
    'Is this you signing in?\nFirefox on Ubuntu\nBan Phu Lon Noi, 34, Thailand (estimated)\nIP address: 183.89.81.19\n9:52:14 AM (ICT) Saturday, Jan 25, 2020\nIf yes, here is the verification code:\nxxxxxx\nIt expires in 5 minutes. ',
    'We heard that you lost your GitHub password. Sorry about that!\nWe heard that you lost your GitHub password. Sorry about that!\nBut don’t worry! You can use the following link to reset your password:\nhttps://github.com/password_reset\nIf you don’t use this link within 3 hours, it will expire. To get a new password reset link, visit https://github.com/password_reset\n\n\Thanks,\nThe GitHub Team ',
    'The ASHRAE Great Energy Predictor Competition has officially closed and we’re amped to share the results with you!',
    'The manufacturing industry is on the cusp of major changes driven by machine learning and artificial intelligence. With machine learning, we can now surface insights to our manufacturing lines more quickly and efficiently than ever before. ',
    "NIKE | Nike Air Force 1 React | Go with the Army\n   In inheriting customs and connecting sports and culture Together, the responsive AF-1 brings a classic look of Force combined with React's modern technology. Resulting in a unique touch in every step that brings By Swoosh Compact, compact insole New designs and soles",
    'Hi chutipong,\nThe great thing about Ionic is that with one codebase, you can build for any platform using familiar web tools and languages.\nFollow along as we create a working Photo Gallery to see how it works. Here’s the before and after:\nIt’s easy to get started. Note that all code referenced in this guide can be found on GitHub.',
  ];

  final List<MaterialColor> color = [
    Colors.brown,
    Colors.blue,
    Colors.pink,
    Colors.purple,
    Colors.red,
    Colors.orange,
    Colors.green
  ];

  final List<String> pic = [
    'assets/launcher/dd.png',
    'assets/launcher/f.png',
    'assets/launcher/g.png',
    'assets/launcher/a.png',
    'assets/launcher/r.png',
    'assets/launcher/n.png',
    'assets/launcher/m.png',
  ];

  @override
  Widget build(BuildContext context) {
    final title = 'Dismissing Items';

  //   final List<String> name = [
  //   'Discord',
  //   'Firefox',
  //   'Github',
  //   'Adison',
  //   'Rapidminer',
  //   'Nike',
  //   'Matt at Ionic'
  // ];

    return MaterialApp(
      title: title,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            // final item = items[index];
            final names = name[index];

            return Dismissible(
              // Each Dismissible must contain a Key. Keys allow Flutter to
              // uniquely identify widgets.
              key: Key(names),
              // Provide a function that tells the app
              // what to do after an item has been swiped away.
              onDismissed: (direction) {
                // Remove the item from the data source.
                setState(() {
                  // items.removeAt(index);
                  name.remove(name[index]);
                  // name.removeWhere((item) => item != null);
                });

                // Then show a snackbar.
                // Scaffold.of(context)
                //     .showSnackBar(SnackBar(content: Text("$item dismissed")));
              },
              // Show a red background as the item is swiped away.
              background: Container(
                alignment: AlignmentDirectional.centerEnd,
                color: Colors.red,
                child: Icon(
                  Icons.delete,
                  color: Colors.white,
                ),
              ),
              child: ListTile(
                title: Text(name[index]),
                subtitle: Text(topic[index]),
              ),
            );
          },
        ),
      ),
    );
  }
}
