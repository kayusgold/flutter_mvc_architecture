import 'package:flutter/material.dart';
import 'package:mvc_architecture/views/views.dart';

class MyRoutes {
  static Future<bool> _popScope() {
    return Future.value(true);
  }

  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case "/entry":
        return MaterialPageRoute(builder: (_) => const EntryPageScreen());
        break;
      case '/second':
        return MaterialPageRoute(builder: (_) => const SecondPage());
      default:
        return MaterialPageRoute(
          builder: (_) => WillPopScope(
            onWillPop: _popScope,
            child: Scaffold(
              body: Center(
                child: Text("no route defined for ${settings.name}"),
              ),
            ),
          ),
        );
    }
  }
}
