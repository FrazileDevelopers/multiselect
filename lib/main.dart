import 'package:flutter/material.dart';
import 'providers/providers.dart';
import 'package:provider/provider.dart';
import 'pages/config/config.dart';

void main() {
  runApp(
    MultiProvider(providers: Providers.providers(), child: ConfigApp()),
  );
}
