import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:visitorsa/Screens/start_screen.dart';
import 'package:visitorsa/utils/AppLanguage.dart';

class SearchDetailsScreen extends StatefulWidget {
  @override
  _SearchDetailsScreenState createState() => _SearchDetailsScreenState();
}

class _SearchDetailsScreenState extends State<SearchDetailsScreen> {
  @override
  @override
  Widget build(BuildContext context) {
    var appLanguage = Provider.of<AppLanguage>(context);

    return SafeArea(
      child: Scaffold(
          body: SingleChildScrollView(
        physics: ScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 3),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListTile(
                title: TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  controller: null,
                  autofocus: false,
                  enabled: false,
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    hintStyle: TextStyle(color: Colors.grey),
                    contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0)),
                  ),
                ),
                trailing: Text(
                  "close",
                  style: TextStyle(color: Colors.red),
                ),
              ),
              ListTile(
                title: Text('Makka location'),
                subtitle: Text('Search hotels nearby',
                    style: TextStyle(color: Colors.green)),
                trailing: Icon(Icons.send),
              ),
              Text('Latest queries'),
              ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: 11,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    leading: Icon(Icons.send),
                    title: Text('Makka location'),
                    subtitle: Text('Search hotels nearby',
                        style: TextStyle(color: Colors.green)),
                    trailing: Text('15 hotels',
                        style: TextStyle(color: Colors.green)),
                  );
                },
              ),
              Text('Latest queries'),
              ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: 11,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    leading: Icon(Icons.send),
                    title: Text('Makka location'),
                    subtitle: Text('Search hotels nearby',
                        style: TextStyle(color: Colors.green)),
                    trailing: Text('15 hotels',
                        style: TextStyle(color: Colors.green)),
                  );
                },
              ),
            ],
          ),
        ),
      )),
    );
  }
}
