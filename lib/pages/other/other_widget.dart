import 'package:flutter/material.dart';
import 'package:flutter_android_navigation/main.dart';
import 'package:flutter_android_navigation/pages/home/home_widget.dart';

class OtherWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("OtherWidget"),
              RaisedButton(
                child: Text("Close"),
                onPressed: () {
                  AppNavigator.of(context).pop();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
