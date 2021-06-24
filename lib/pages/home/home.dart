import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:multiselect/providers/userProvider.dart';
import 'package:multiselect/widgets/dialog.dart';
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
    Provider.of<UsersProvider>(context, listen: false).fetchData();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // final users = Provider.of<UsersProvider>(context);
    final selectionList = context
        .watch<UsersProvider>()
        .getData()
        .data!
        .where((element) => element.selection!)
        .toList();
    return Scaffold(
      appBar: AppBar(
        title: Text('Users'),
      ),
      body: context.watch<UsersProvider>().isFetching
          ? Center(
              child: SpinKitCircle(
                color: Colors.pink,
              ),
            )
          : selectionList.length <= 0
              ? Center(
                  child: Text(
                    'No Users Selected!',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                )
              : ListView.separated(
                  itemBuilder: (c, i) => Dismissible(
                    key: Key(selectionList[i].firstName.toString()),
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
                    onDismissed: (direction) {},
                    child: ListTile(
                      title: Text(selectionList[i].firstName.toString()),
                    ),
                  ),
                  separatorBuilder: (c, i) => Divider(),
                  itemCount: selectionList.length,
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
