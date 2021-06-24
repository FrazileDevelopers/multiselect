import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '/providers/userProvider.dart';
import 'package:provider/provider.dart';

class CustomDialog extends StatefulWidget {
  const CustomDialog({Key? key}) : super(key: key);

  @override
  _CustomDialogState createState() => _CustomDialogState();
}

class _CustomDialogState extends State<CustomDialog> {
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
    final selectionList = context
        .watch<UsersProvider>()
        .getData()
        .data!
        .where((element) => !element.selection!)
        .toList();
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          5.0,
        ),
      ),
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      child: contentBox(context, selectionList),
    );
  }

  contentBox(context, selectionList) => Container(
        height: MediaQuery.of(context).size.height * .7,
        color: Colors.white,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              ...List.generate(
                selectionList.length,
                (index) => ListTile(
                  title: Text(
                    selectionList[index].firstName.toString(),
                    style: TextStyle(color: Colors.black),
                  ),
                  trailing: Checkbox(
                    value: false,
                    activeColor: Colors.pink,
                    onChanged: (bool? value) {},
                  ),
                ),
              ),
              ListTile(
                title: Text(
                  'True',
                  style: TextStyle(color: Colors.black),
                ),
                trailing: CupertinoSwitch(
                  value: false,
                  activeColor: Colors.pink,
                  onChanged: (value) {},
                ),
              ),
              MaterialButton(
                onPressed: () =>
                    context.read<UsersProvider>().updateSelection(),
                child: Text('Submit'),
                color: Colors.pink,
                textColor: Colors.white,
              ),
            ],
          ),
        ),
      );
}
