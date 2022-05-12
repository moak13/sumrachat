import 'package:stacked/stacked.dart';

import '../app/app.locator.dart';
import '../app/app.logger.dart';
import '../models/conversation_model.dart';
import '../services/database_service.dart';

const String _conversationTable = 'conversations';

class ConversationStore extends BaseViewModel {
  final _databaseService = locator<DatabaseService>();
  final _log = getLogger('ConversationStore');

  Stream<List<ConversationModel>> getStreamMessages() async* {
    _log.i('fetching local conversations');
    List<Map<String, dynamic>> _messagesResults =
        await _databaseService.database!.query(_conversationTable);
    yield _messagesResults.map((e) => ConversationModel.fromJson(e)).toList();
  }

  Future<List<ConversationModel>> getMessagesById({num? id}) async {
    _log.i('fetching local conversations');
    List<Map<String, dynamic>> _messageResults =
        await _databaseService.database!.query(
      _conversationTable,
      where: 'user_id = ?',
      whereArgs: [id],
    );
    return _messageResults.map((e) => ConversationModel.fromJson(e)).toList();
  }

  Future<void> addMessage({ConversationModel? message}) async {
    _log.i('add message');
    await _databaseService.database!
        .insert(_conversationTable, message!.toJson());
    notifyListeners();
  }
}
