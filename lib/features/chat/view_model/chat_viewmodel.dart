import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../core/app/app.locator.dart';
import '../../../core/models/conversation_model.dart';
import '../../../core/models/message_model.dart';
import '../../../core/stores/conversation_store.dart';
import '../../../core/stores/message_store.dart';

class ChatViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final _messageStore = locator<MessageStore>();
  final _conversationStore = locator<ConversationStore>();

  List<ConversationModel> _conversationsList = [];
  List<ConversationModel> get conversationsList => _conversationsList;

  void back() {
    _navigationService.back(result: true);
  }

  void getConversations({num? id}) async {
    var _conversations = await _conversationStore.getMessagesById(id: id);
    _conversationsList = _conversations;
    notifyListeners();
  }

  void addConversation({ConversationModel? conversationModel}) async {
    await _conversationStore.addMessage(message: conversationModel);
    final localMessage =
        await _messageStore.getMessageById(id: conversationModel?.userId);
    if (localMessage == null) {
      await _messageStore.addMessage(
          message: MessageModel(
        fullName: conversationModel?.fullName,
        firstName: conversationModel?.firstName,
        lastName: conversationModel?.lastName,
        image: conversationModel?.image,
        message: conversationModel?.message,
        userId: conversationModel?.userId,
      ));
    } else {
      final newMessage = localMessage.copyWith(
        message: conversationModel?.message,
      );
      await _messageStore.updateMessage(message: newMessage);
    }
    _addBotReply(
      message: ConversationModel(
        fullName: conversationModel?.fullName,
        image: conversationModel?.image,
        firstName: conversationModel?.firstName,
        lastName: conversationModel?.lastName,
        isMe: 0,
        userId: conversationModel?.userId,
        message:
            'hello there, nice of you to drop by. My name is ${conversationModel?.fullName}. I am sorry I can\'t respond right now, but will when I come online. Cheers!',
      ),
    );
  }

  void _addBotReply({ConversationModel? message}) async {
    await _conversationStore.addMessage(message: message).then((value) async {
      Future.delayed(const Duration(seconds: 4));
      final data = await _messageStore.getMessageById(id: message!.userId);
      final newMessage = data?.copyWith(
        message: message.message,
      );
      if (newMessage != null) {
        await _messageStore.updateMessage(message: newMessage);
      }
      Future.delayed(const Duration(minutes: 2));
      getConversations(id: message.userId);
    });
  }
}
