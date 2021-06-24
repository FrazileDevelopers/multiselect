import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'listProvider.dart';
import 'userProvider.dart';

class Providers {
  static List<SingleChildWidget> providers() => [
        ChangeNotifierProvider<ListProvider>(
          create: (_) => ListProvider(),
        ),
      ];
}
