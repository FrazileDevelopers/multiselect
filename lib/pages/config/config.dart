import 'package:flutter/material.dart';
import '/themes/styles.dart';
import '/constants/constants.dart';
import '/routes/router.dart';

class ConfigApp extends StatefulWidget {
  const ConfigApp({Key? key}) : super(key: key);

  @override
  _ConfigAppState createState() => _ConfigAppState();
}

class _ConfigAppState extends State<ConfigApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MultiSelect',
      debugShowCheckedModeBanner: false,
      theme: Styles.themeData(false, context),
      onGenerateRoute: Routers.generateRoute,
      initialRoute: Constants.initial,
    );
  }
}
