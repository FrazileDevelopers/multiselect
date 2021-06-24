import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomDialog extends StatefulWidget {
  const CustomDialog({Key? key}) : super(key: key);

  @override
  _CustomDialogState createState() => _CustomDialogState();
}

class _CustomDialogState extends State<CustomDialog> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          5.0,
        ),
      ),
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      child: contentBox(context),
    );
  }

  contentBox(context) => Container(
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              title: Text(
                'M',
                style: TextStyle(color: Colors.black),
              ),
              trailing: Checkbox(
                value: true,
                activeColor: Colors.pink,
                onChanged: (bool? value) {},
              ),
            ),
            ListTile(
              title: Text(
                'True',
                style: TextStyle(color: Colors.black),
              ),
              trailing: CupertinoSwitch(
                value: true,
                activeColor: Colors.pink,
                onChanged: (value) {},
              ),
            )
          ],
        ),
      );
}
