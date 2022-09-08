import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_provider_mvvm_state_mgt_two/model/user_model.dart';
import 'package:flutter_provider_mvvm_state_mgt_two/repositories/auth_repository.dart';
import 'package:flutter_provider_mvvm_state_mgt_two/utils/general_utils.dart';
import 'package:flutter_provider_mvvm_state_mgt_two/view_model/user_view_model.dart';

import '../utils/routes/routes_name.dart';

class AuthViewModel extends ChangeNotifier {
  final _myRepo = AuthRepository();
  final _currentUser = UserViewModel();

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  Future<void> loginApi(dynamic data, BuildContext context) async {
    setLoading(true);
    _myRepo.loginApi(data).then((value) {
      setLoading(false);

      Utils.flushErrorMessage(value.toString(), context, success: true);
      if (kDebugMode) {
        print(value);
      }

      _currentUser.saveUser(UserModel(token: value["token"]));
      if (value != null) {
        Navigator.pushReplacementNamed(context, RoutesName.home);
      }
    }).onError((error, stackTrace) {
      setLoading(false);
      Utils.flushErrorMessage(error.toString(), context);
    });
  }
}
