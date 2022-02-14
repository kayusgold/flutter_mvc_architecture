import 'package:flutter/material.dart';
import 'package:mvc_architecture/controllers/entry_screen_controller.dart';
import 'package:provider/provider.dart';

import 'router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<EntryScreenController>(
          create: (_) => EntryScreenController(),
        )
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: "/entry",
        onGenerateRoute: MyRoutes.generateRoute,
      ),
    );
  }
}
