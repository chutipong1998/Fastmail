import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:intl/intl.dart';

import 'photo.dart';

final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
final SnackBar snackBar = const SnackBar(content: Text('Showing Snackbar'));

void openPage(BuildContext context) {
  Navigator.push(context, MaterialPageRoute(
    builder: (BuildContext context) {
      //
      return Scaffold(
        appBar: AppBar(
          actions: <Widget>[
            // iconbutton('archive',Icons.archive),
            // iconbutton('delete',Icons.delete),
            // iconbutton('email',Icons.email),
            // iconbutton('more',Icons.more_vert),
          ],
        ),
        body: Center(
          child: Text(
            'This is the next page',
            style: TextStyle(fontSize: 24),
          ),
        ),
      );
    },
  ));
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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
    timeDilation = 2.0;
    final now = DateTime.now();
    final formattedDate = DateFormat('MMM, d yyyy').format(now);

    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: Text('Inbox'),
        // title: Text(widget.title),
        // actions: <Widget>[
        //   iconbutton('serach',Icons.search),
        // ],
      ),
      body: ListView.builder(
        itemCount: name.length,
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
                pic.remove(pic[index]);
                color.remove(color[index]);
                des.remove(des[index]);
                topic.remove(topic[index]);
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
            child: Column(
              children: <Widget>[
                Column(
                  children: <Widget>[
                    ListTile(
                      leading: CircleAvatar(
                        backgroundColor: color[index],
                        child: Column(
                          children: <Widget>[
                            CircleAvatar(
                              child: ClipOval(
                                child: AnimateHero(context, pic[index],
                                    topic[index], name[index], des[index]),
                              ),
                              backgroundColor: color[index],
                            ),
                          ],
                        ),
                      ),
                      // Image.network("http://pluspng.com/img-png/google-logo-png-open-2000.png",width: 40,height: 40,),
                      title: Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(name[index]),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(topic[index].substring(0, 23) + '...'),
                              ],
                            ),
                          ],
                        ),
                      ),
                      subtitle: Text(des[index].substring(0, 23) + '...'),
                      onTap: () {
                        // openPage(context);
                        Navigator.of(context).push(MaterialPageRoute<void>(
                            builder: (BuildContext context) {
                          return Scaffold(
                            appBar: AppBar(
                              // title: const Text('Flippers Page'),
                              actions: <Widget>[
                                iconbutton('archive', Icons.archive),
                                iconbutton('delete', Icons.delete),
                                // iconbutton('email', Icons.email),
                                // iconbutton('more', Icons.more_vert),
                              ],
                            ),
                            body: ListView(
                              padding: EdgeInsets.all(8),
                              children: <Widget>[
                                Container(
                                  alignment: Alignment.topLeft,
                                  child: Column(
                                    children: <Widget>[
                                      Ttxt(topic[index]),
                                      Divider(),
                                      Img(pic[index], name[index]),
                                      Divider(),
                                      Bbody(des[index])
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          );
                        }));
                      },
                    )
                  ],
                ),
                Divider(),
              ],
            ),
          );
        },
      ),
      drawer: drawer(context),
    );
  }

  Widget Ttxt(text) {
    return Row(
      children: <Widget>[
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(10),
            child: Text(
              text,
              style: TextStyle(
                fontSize: 18,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget AnimateHero(BuildContext context, image, txt, text, body) {
    return Center(
      child: PhotoHero(
        photo: image,
        width: 300.0,
        onTap: () {
          Navigator.of(context)
              .push(MaterialPageRoute<void>(builder: (BuildContext context) {
            return Scaffold(
              appBar: AppBar(
                // title: const Text('Flippers Page'),
                actions: <Widget>[
                  iconbutton('archive', Icons.archive),
                  iconbutton('delete', Icons.delete),
                  // iconbutton('email', Icons.email),
                  // iconbutton('more', Icons.more_vert),
                ],
              ),
              body: ListView(
                padding: EdgeInsets.all(8),
                children: <Widget>[
                  Container(
                    alignment: Alignment.topLeft,
                    child: Column(
                      children: <Widget>[
                        Ttxt(txt),
                        Divider(),
                        Img(image, text),
                        Divider(),
                        Bbody(body)
                      ],
                    ),
                  ),
                ],
              ),
            );
          }));
        },
      ),
    );
  }

  Widget Img(image, txt) {
    return Row(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.all(2),
          child: PhotoHero(
            photo: image,
            width: 50.0,
            onTap: () {
              // Navigator.of(context).pop();
            },
          ),
        ),
        Expanded(
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.all(5),
                    child: Text(txt),
                    //
                  )
                ],
              ),
              Row(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.all(5),
                    child: Text('To me'),
                    //
                  )
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget Bbody(txt) {
    return Row(children: <Widget>[
      Expanded(
        child: Padding(
          padding: EdgeInsets.all(25),
          child: Text(txt),
        ),
      )
    ]);
  }

  Widget drawer(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          drawerHead(),
          listile(context, 'Inbox', Icons.inbox, '/home-page'),
          listile(context, 'Spam', Icons.report, '/spam-page'),
          listile(context, 'Trash', Icons.delete, '/trash-page'),
        ],
      ),
    );
  }

  Widget iconbutton(text, icon) {
    return IconButton(
      icon: Icon(icon),
      tooltip: text,
      onPressed: () {
        // _onSubmit;
        // openPage(context);
        // scaffoldKey.currentState.showSnackBar(snackBar);
      },
    );
  }

  Widget listile(BuildContext context, text, icon, route) {
    return ListTile(
      leading: IconButton(
        icon: Icon(icon),
        onPressed: () {
          // openPage(context);
          Navigator.pushNamed(context, route);
        },
      ),
      title: Text(
        text,
      ),
      onTap: () {
        // openPage(context);
        Navigator.pushNamed(context, route);
      },
    );
  }

  Widget drawerHead() {
    return UserAccountsDrawerHeader(
      accountName: Text('chutipong'),
      accountEmail: Text('chutipong.sa.60@ubu.ac.th'),
      currentAccountPicture: CircleAvatar(
        backgroundColor: Colors.yellow,
        child: Text(
          'Chutipong'.substring(0, 1),
          style: TextStyle(
            fontSize: 45,
            color: Colors.white,
          ),
        ),
      ),
      decoration: BoxDecoration(
        color: Colors.blue,
      ),
    );
  }
}
