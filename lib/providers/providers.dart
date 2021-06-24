import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'userProvider.dart';

class Providers {
  static List<SingleChildWidget> providers() => [
        ChangeNotifierProvider<UsersProvider>(
          create: (_) => UsersProvider(),
        ),
      ];
}
