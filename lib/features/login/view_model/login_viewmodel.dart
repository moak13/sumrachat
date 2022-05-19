import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../core/app/app.locator.dart';
import '../../../core/app/app.router.dart';
import '../../../core/models/user_model.dart';
import '../../../core/stores/user_store.dart';

class LoginViewModel extends BaseViewModel {
  final _userStore = locator<UserStore>();
  final _navigationService = locator<NavigationService>();

  Future<void> loginUser() async {
    setBusy(true);
    await Future.delayed(const Duration(seconds: 4));
    await _userStore.addUser(user: UserModel.fromJson(UserModel.userToLogIn));
    setBusy(false);
    _navigationService.clearStackAndShow(Routes.wrapperView);
  }
}
