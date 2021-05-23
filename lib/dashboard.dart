import 'package:flutter/material.dart';

import 'items_const.dart';

class MyApp2 extends StatelessWidget {
  final List<ListItem> items = courseKeepCalm;

  MyApp2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Josefin',
        textTheme: Typography(platform: TargetPlatform.linux).white,
      ),
      home: Scaffold(
        backgroundColor: Colors.deepPurple,
        body: ListView.builder(
          // Let the ListView know how many items it needs to build.
          itemCount: items.length,
          // Provide a builder function. This is where the magic happens.
          // Convert each item into a widget based on the type of item it is.
          itemBuilder: (context, index) {
            final item = items[index];
            ListTile list;

            if (item is HeadingItem){
              list = ListTile(
                  isThreeLine: true ,
                  title: item.buildTitle(context),
                  subtitle: item.buildSubtitle(context),
                  );
            } else {
              list = ListTile(
                  isThreeLine: true ,
                  title: item.buildTitle(context),
                  subtitle: item.buildSubtitle(context),
                  trailing: IconButton(onPressed: null, icon: Icon(Icons.play_arrow_outlined,size: 40,  color: Colors.white70))
                  );
            }

            return Card(color: Colors.deepPurple, child:list);
          },
        ),
      ),
    );
  }
}

/// The base class for the different types of items the list can contain.
abstract class ListItem {
  /// The title line to show in a list item.
  Widget buildTitle(BuildContext context);

  /// The subtitle line, if any, to show in a list item.
  Widget buildSubtitle(BuildContext context);
}

/// A ListItem that contains data to display a heading.
class HeadingItem implements ListItem {
  final String heading;

  HeadingItem(this.heading);

  @override
  Widget buildTitle(BuildContext context) {
    return Container(child: Column(children: [ Text(
      heading,
      style: TextStyle(fontFamily: 'Josefin' ,fontSize: 30, color: Colors.white70),
    )]));
  }

  @override
  Widget buildSubtitle(BuildContext context) => SizedBox();
}

/// A ListItem that contains data to display a message.
class MessageItem implements ListItem {
  final String sender;
  final String body;

  MessageItem(this.sender, this.body);

  @override
  Widget buildTitle(BuildContext context) => Text(sender, style: TextStyle(fontFamily: 'Josefin'));

  @override
  Widget buildSubtitle(BuildContext context) => Text(body, style: TextStyle(fontFamily: 'Josefin'));
}