import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:multiselect/constants/constants.dart';
import 'model/usersapi.dart';

class UsersProvider with ChangeNotifier {
  UsersProvider();

  bool _isFetching = false;

  bool get isFetching => _isFetching;

  UsersApi api = UsersApi();

  Future<UsersApi> fetchData() async {
    _isFetching = true;
    String jsonResponse = '';
    notifyListeners();

    var url = Uri.parse(Constants.apiURL);
    var res = await http.get(url);

    if (res.statusCode == 200) {
      jsonResponse = res.body;
    }

    _isFetching = false;
    notifyListeners();

    if (jsonResponse.isNotEmpty) {
      var decodedRes = jsonDecode(res.body);
      api = UsersApi.fromJson(decodedRes);
    }

    return api;
  }

  UsersApi getData() => api;
}
