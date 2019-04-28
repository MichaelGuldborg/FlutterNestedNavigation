import 'package:flutter/material.dart';
import 'package:flutter_android_navigation/pages/home/home_widget.dart';

class HomeScreen2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color(0xFFdcedc1),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("Home 2"),
              RaisedButton(
                child: Text("Back"),
                onPressed: () {
                  HomeWidgetState.of(context).onBackPress();
                },
              ),
              RaisedButton(
                child: Text("Next"),
                onPressed: () {
                  Navigator.of(context).pushNamed(HomeWidgetRoutes.screen3);
                },
              ),
              RaisedButton(
                child: Text("Another Home 2"),
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
