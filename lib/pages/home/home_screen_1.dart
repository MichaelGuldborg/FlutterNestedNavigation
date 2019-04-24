import 'package:flutter/material.dart';
import 'package:flutter_android_navigation/pages/home/home_widget.dart';

class HomeScreen1 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => HomeScreen1State();
}

class HomeScreen1State extends State<HomeScreen1> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Theme.of(context).backgroundColor.withGreen(200),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("Home 1"),
              RaisedButton(
                child: Text("Next"),
                onPressed: () {
                  Navigator.of(context).pushNamed(HomeWidgetRoutes.screen2);
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
