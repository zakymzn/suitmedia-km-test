import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:suitmedia_km_test/api/reqres_api.dart';
import 'package:suitmedia_km_test/data/users_data.dart';
import 'package:suitmedia_km_test/utility/result_state.dart';
import 'package:http/http.dart' as http;

class UserListProvider extends ChangeNotifier {
  final ReqresAPI reqresAPI;
  final int page;

  UserListProvider({required this.reqresAPI, required this.page}) {
    _fetchAllUserList(page);
  }

  late Users _users;
  late ResultState _state;
  String _message = '';

  Users get users => _users;
  ResultState get state => _state;
  String get message => _message;

  Future _fetchAllUserList(page) async {
    try {
      _state = ResultState.loading;
      notifyListeners();
      final user = await reqresAPI.list(http.Client(), page);
      if (user.data.isEmpty) {
        _state = ResultState.noData;
        notifyListeners();
        return _message = 'No data';
      } else {
        _state = ResultState.hasData;
        notifyListeners();
        return _users = user;
      }
    } catch (e) {
      _state = ResultState.error;
      notifyListeners();
      return _message = 'Error: $e';
    }
  }

  Future refreshPage() async {
    await _fetchAllUserList(1);
  }
}
