import 'package:flutter/material.dart';
import 'package:multiselect/themes/styles.dart';
import '/constants/constants.dart';
import '/providers/providers.dart';
import '/routes/router.dart';
import 'package:provider/provider.dart';

class ConfigApp extends StatefulWidget {
  const ConfigApp({Key? key}) : super(key: key);

  @override
  _ConfigAppState createState() => _ConfigAppState();
}

class _ConfigAppState extends State<ConfigApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: Providers.providers(),
      child: MaterialApp(
        title: 'MultiSelect',
        debugShowCheckedModeBanner: false,
        theme: Styles.themeData(false, context),
        onGenerateRoute: Routers.generateRoute,
        initialRoute: Constants.initial,
      ),
    );
  }
}
