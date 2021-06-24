import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '/providers/listProvider.dart';
import '/providers/userProvider.dart';
import '/widgets/dialog.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final selectionList = context
        .watch<ListProvider>()
        .listData
        .where((element) => element.selection)
        .toList();
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: ListView.builder(
        itemCount: selectionList.length,
        itemBuilder: (context, index) {
          final item = selectionList[index];
          return Dismissible(
            key: Key(item.firstName!),
            background: Padding(
              padding: const EdgeInsets.only(right: 10.0),
              child: Container(
                color: Colors.red,
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    'Delete',
                  ),
                ),
              ),
            ),
            direction: DismissDirection.endToStart,
            onDismissed: (direction) {
              context.read<ListProvider>().updateSelection(item);
            },
            child: ListTile(
              title: Text(item.firstName!),
              subtitle: Text(item.email!),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => showDialog(
          context: context,
          builder: (context) => CustomDialog(),
        ),
        child: Icon(Icons.add),
        backgroundColor: Colors.pink,
        foregroundColor: Colors.white,
      ),
    );
  }
}
