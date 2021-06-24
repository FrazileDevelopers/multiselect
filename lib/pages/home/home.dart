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
    final users = Provider.of<UsersProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Users'),
      ),
      body: users.isFetching
          ? Center(
              child: SpinKitChasingDots(
                color: Colors.pink,
              ),
            )
          : ListView.separated(
              itemBuilder: (c, i) => Dismissible(
                key: Key(users.getData().data![i].firstName.toString()),
                child: ListTile(
                  title: Text(users.getData().data![i].firstName.toString()),
                ),
              ),
              separatorBuilder: (c, i) => Divider(),
              itemCount: users.getData().data!.length,
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
