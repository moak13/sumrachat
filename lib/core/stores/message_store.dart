import 'package:sqflite/sql.dart';
import 'package:stacked/stacked.dart';

import '../app/app.locator.dart';
import '../app/app.logger.dart';
import '../models/message_model.dart';
import '../services/database_service.dart';

const String _messageTable = 'messages';

class MessageStore extends BaseViewModel {
  final _databaseService = locator<DatabaseService>();
  final _log = getLogger('MessageStore');

  Stream<List<MessageModel>> getStreamMessages() async* {
    List<Map<String, dynamic>> _messagesResults =
        await _databaseService.database!.query(_messageTable);
    yield _messagesResults
        .map((e) => MessageModel.fromJson(e))
        .toList()
        .reversed
        .toList();
  }

  Future<List<MessageModel>> getMessages() async {
    _log.i('fetching local messages');
    List<Map<String, dynamic>> _messageResults =
        await _databaseService.database!.query(_messageTable);
    return _messageResults
        .map((e) => MessageModel.fromJson(e))
        .toList()
        .reversed
        .toList();
  }

  Future<MessageModel?> getMessageById({num? id}) async {
    _log.i('get message by id');
    List<Map<String, dynamic>> _messageResults =
        await _databaseService.database!.query(
      _messageTable,
      where: 'user_id = ?',
      whereArgs: [id],
    );
    if (_messageResults.isEmpty) {
      return null;
    }
    return MessageModel.fromJson(_messageResults.first);
  }

  Future<void> addMessage({MessageModel? message}) async {
    _log.i('add message');
    await _databaseService.database!.insert(_messageTable, message!.toJson());
    notifyListeners();
  }

  Future<void> updateMessage({required MessageModel message}) async {
    _log.i('message updated');
    _log.v(message.id);
    await _databaseService.database!.update(
      _messageTable,
      message.toJson(),
      where: 'id = ?',
      whereArgs: [message.id],
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    notifyListeners();
  }
}
