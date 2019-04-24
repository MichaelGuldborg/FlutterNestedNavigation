import 'package:flutter/material.dart';
import 'package:flutter_android_navigation/main.dart';
import 'package:flutter_android_navigation/pages/home/home_widget.dart';

class HomeScreen3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color(0xFFffaaa5),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("Home 3"),
              RaisedButton(
                child: Text("Start other activity"),
                onPressed: () {
                  AppNavigator.of(context).pushNamed(AppRoutes.other);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
