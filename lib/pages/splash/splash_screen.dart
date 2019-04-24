import 'package:flutter/material.dart';
import 'package:flutter_android_navigation/main.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    // Delay for visual effect
    Future.delayed(const Duration(seconds: 1), () {
      // Implement auth check if home requires authentication
      Navigator.of(context).pushReplacementNamed(AppRoutes.home);
    });
  }

  @override
  Widget build(BuildContext context) {
    var deviceSize = MediaQuery.of(context).size;
    return Material(
      child: Container(
        color: Colors.white,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: deviceSize.height / 8,
                width: deviceSize.width / 2,
                child: FlutterLogo(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
