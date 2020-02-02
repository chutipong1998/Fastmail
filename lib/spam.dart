import 'package:flutter/material.dart';

class Spam extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Spam'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Icon(
              Icons.report,
              size: 100.0,
              color: Colors.grey,
            ),
            Text(
              'No mail in this',
              style: TextStyle(
                fontSize: 20,
                color: Colors.grey
              ),
            )
          ],
        ),
      ),
      drawer: drawer(context),
    );
  }
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