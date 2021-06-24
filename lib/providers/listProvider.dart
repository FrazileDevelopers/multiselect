import 'package:flutter/material.dart';
import 'model/userList.dart';
import 'users.dart';

class ListProvider with ChangeNotifier {
  bool _isFetching = false;

  bool get isFetching => _isFetching;

  List<UserListData> _listData = [];

  List<UserListData> get listData => _listData;

  ListProvider() {
    _isFetching = true;
    notifyListeners();
    UsersServices().fetchData(1).then((value) {
      _listData = value.data!;
      _isFetching = false;
      notifyListeners();
    });
  }

  void updateSelection(UserListData item) {
    var index = _listData.indexOf(item);
    _listData[index].selection = !_listData[index].selection;
    _listData[index].selectionTemp = _listData[index].selection;
    notifyListeners();
  }

  void updateTempSelection(UserListData item) {
    var index = _listData.indexOf(item);
    _listData[index].selectionTemp = !_listData[index].selectionTemp;
    notifyListeners();
  }

  void confirm() {
    _listData.asMap().forEach((int i, UserListData e) => {
          if (e.selectionTemp) {_listData[i].selection = true}
        });
    notifyListeners();
  }

  void rejectChanges() {
    _listData.asMap().forEach((int i, UserListData e) => {
          if (e.selectionTemp && !e.selection)
            {_listData[i].selectionTemp = false}
        });
    notifyListeners();
  }
}
