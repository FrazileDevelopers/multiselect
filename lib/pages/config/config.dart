import 'package:flutter/material.dart';
import 'package:multiselect/constants/constants.dart';
import 'package:multiselect/routes/router.dart';

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
      theme: ThemeData.dark(),
      onGenerateRoute: Routers.generateRoute,
      initialRoute: Constants.initial,
    );
  }
}
