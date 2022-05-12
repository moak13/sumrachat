import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../core/app/app.locator.dart';
import '../../../core/app/app.router.dart';
import '../../../core/models/message_model.dart';
import '../../../core/models/user_model.dart';
import '../../../core/static/users_list.dart';
import '../../../core/stores/message_store.dart';

class HomeViewModel extends StreamViewModel<List<MessageModel>> {
  final _navigationService = locator<NavigationService>();
  final _messageStore = locator<MessageStore>();
  List<UserModel> _userList = [];
  List<UserModel> get userList => _userList;

  List<MessageModel> _messageList = [];
  List<MessageModel> get messageList => _messageList;

  List<MessageModel> _searchMessageList = [];
  List<MessageModel> get searchMessageList => _searchMessageList;

  void getUserList() {
    setBusy(true);
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
      _searchMessageList = _messageList;
      return;
    }

    _searchMessageList = _messageList
        .where((element) =>
            element.fullName!.toLowerCase().contains(text.toLowerCase()))
        .toList();
    setBusy(false);
    notifyListeners();
  }

  @override
  Stream<List<MessageModel>> get stream => _messageStore.getStreamMessages();

  List<MessageModel> get messagesData {
    stream.listen((event) {
      _messageList = event;
      notifyListeners();
    });
    return _messageList;
  }
}
