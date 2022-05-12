import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../core/app/app.locator.dart';
import '../../../core/app/app.router.dart';
import '../../../core/models/user_model.dart';
import '../../../core/static/users_list.dart';

class PeopleViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  List<UserModel> _userList = [];
  List<UserModel> get userList => _userList;

  List<UserModel> _searchUserList = [];
  List<UserModel> get searchUserList => _searchUserList;

  void getUserList() {
    final _users = users;
    _userList = _users;
    notifyListeners();
  }

  void moveToChat(UserModel user) {
    _navigationService.navigateTo(
      Routes.chatView,
      arguments: ChatViewArguments(
        userModel: user,
      ),
    );
  }

  void search(String text) {
    setBusy(true);
    if (text.isEmpty) {
      _searchUserList = _userList;
      return;
    }

    _searchUserList = _userList
        .where((element) =>
            element.fullName.toLowerCase().contains(text.toLowerCase()))
        .toList();
    setBusy(false);
    notifyListeners();
  }
}
