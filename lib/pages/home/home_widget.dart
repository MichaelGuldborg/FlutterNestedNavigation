import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_android_navigation/pages/home/home_screen_1.dart';
import 'package:flutter_android_navigation/pages/home/home_screen_2.dart';
import 'package:flutter_android_navigation/pages/home/home_screen_3.dart';

class HomeWidgetRoutes {
  static const screen1 = "screen1";
  static const screen2 = "screen2";
  static const screen3 = "screen3";
}

class _HomeWidgetStateProvider extends InheritedWidget {
  final HomeWidgetState state;

  _HomeWidgetStateProvider({this.state, child}) : super(child: child);

  @override
  bool updateShouldNotify(_HomeWidgetStateProvider old) => false;
}

class HomeWidget extends StatefulWidget {
  @override
  HomeWidgetState createState() => HomeWidgetState();
}

class HomeWidgetState extends State<HomeWidget> {
  static HomeWidgetState of(BuildContext context) {
    return (context.inheritFromWidgetOfExactType(_HomeWidgetStateProvider)
            as _HomeWidgetStateProvider)
        .state;
  }

  final navKey = GlobalKey<NavigatorState>();

  final String initialRouteName = "screen1";
  String currentRouteName = "screen1";

  get isInitialRoute => currentRouteName == initialRouteName;

  get routeTitle => routeTitles[currentRouteName];

  Future<bool> onBackPress() async {
    if (!navKey.currentState.canPop()) {
      return true;
    }
    navKey.currentState.pop();
    updateRouteName();
    return false;
  }

  void updateRouteName() {
    /// Check current route with popUntil callback function
    navKey.currentState.popUntil((route) {
      final String routeName = route.settings.isInitialRoute
          ? initialRouteName
          : route.settings.name;
      setState(() {
        currentRouteName = routeName;
      });

      /// Return true to not pop
      return true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return _HomeWidgetStateProvider(
      state: this,
      child: WillPopScope(
        onWillPop: onBackPress,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            title: Text(routeTitle, style: TextStyle(color: Colors.black)),
            leading: isInitialRoute
                ? Container()
                : IconButton(
                    icon: const BackButtonIcon(),
                    color: Colors.black,
                    onPressed: onBackPress),
          ),
          body: MaterialApp(
            navigatorKey: navKey,
            debugShowCheckedModeBanner: false,

            /// Add widget (activity) specific styles
            /// Could also be set to global style with [Theme.of(context)]
            theme: ThemeData(
              backgroundColor: Color(0xFFF3F3F3),

              /// Change animation to iOS like slide right animation
              pageTransitionsTheme: PageTransitionsTheme(builders: {
                TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
                TargetPlatform.android: CupertinoPageTransitionsBuilder(),
              }),
            ),
            home: HomeScreen1(),
            onGenerateRoute: onGenerateRoute,
          ),
        ),
      ),
    );
  }

  /// Screen map (fragments)
  final routes = <String, Widget>{
    HomeWidgetRoutes.screen1: HomeScreen1(),
    HomeWidgetRoutes.screen2: HomeScreen2(),
    HomeWidgetRoutes.screen3: HomeScreen3(),
  };

  /// Screen titles (fragment titles)
  final routeTitles = <String, String>{
    HomeWidgetRoutes.screen1: "Home Screen 1",
    HomeWidgetRoutes.screen2: "Home Screen 2",
    HomeWidgetRoutes.screen3: "Home Screen 3"
  };

  /// Navigation function (similar to navigateTo(Fragment fragment))
  Route onGenerateRoute(RouteSettings settings) {
    final String routeName = settings.name;
    final Widget nextWidget = routes[routeName];
    setState(() {
      currentRouteName = routeName;
    });

    return MaterialPageRoute(
      settings: settings,
      builder: (BuildContext context) => nextWidget,
    );
  }
}
