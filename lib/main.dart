import 'package:flutter/material.dart';
import 'package:flutter_android_navigation/pages/home/home_widget.dart';
import 'package:flutter_android_navigation/pages/other/other_widget.dart';
import 'package:flutter_android_navigation/pages/splash/splash_screen.dart';

void main() => runApp(App());

/// Root application routes (activities)
class AppRoutes {
  static const String splash = "splash";
  static const String home = "home";
  static const String other = "other";
}

/// To make the root navigator (activity navigator) globally available
/// we will need to wrap the whole application in an appStateProvider widget
/// for more information on [InheritedWidget] read this article
/// https://medium.com/flutter-community/widget-state-buildcontext-inheritedwidget-898d671b7956

class _AppStateProvider extends InheritedWidget {
  final AppState state;

  _AppStateProvider({this.state, child}) : super(child: child);

  @override
  bool updateShouldNotify(_AppStateProvider old) => false;
}

/// For convenience we create a static class and function to get only
/// the app level navigator from the app state
class AppNavigator {
  static NavigatorState of(BuildContext context) {
    return AppState.of(context).navKey.currentState;
  }
}

/// Root application widget
class App extends StatefulWidget {
  State<App> createState() => AppState();
}

/// Root application state
/// implements an "of" function that returns the [AppState] from context of
/// a widget in the application widget tree
class AppState extends State<App> {
  static AppState of(BuildContext context) {
    return (context.inheritFromWidgetOfExactType(_AppStateProvider)
            as _AppStateProvider)
        .state;
  }

  /// The app state contains a key for the app level navigator in the
  /// [MaterialApp] widget which can be used to push, pop and replace routes
  final navKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return _AppStateProvider(
      state: this,
      child: MaterialApp(
        navigatorKey: navKey,
        initialRoute: AppRoutes.splash,
        routes: <String, WidgetBuilder>{
          AppRoutes.splash: (BuildContext context) => SplashScreen(),
          AppRoutes.home: (BuildContext context) => HomeWidget(),
          AppRoutes.other: (BuildContext context) => OtherWidget(),
        },
      ),
    );
  }
}
