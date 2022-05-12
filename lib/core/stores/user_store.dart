import 'package:sqflite/sqlite_api.dart';

import '../app/app.locator.dart';
import '../app/app.logger.dart';
import '../models/user_model.dart';
import '../services/database_service.dart';

const String _userTable = 'user';

class UserStore {
  final _databaseService = locator<DatabaseService>();
  final _log = getLogger('UserStore');

  Stream<List<UserModel>> getStreamUsers() async* {
    List<Map<String, dynamic>> _userResults =
        await _databaseService.database!.query(_userTable);
    yield _userResults.map((e) => UserModel.fromJson(e)).toList();
  }

  Future<List<UserModel>> getUsers() async {
    _log.i('fetching local users');
    List<Map<String, dynamic>> _userResults =
        await _databaseService.database!.query(_userTable);
    return _userResults.map((e) => UserModel.fromJson(e)).toList();
  }

  Future<void> addUsers({List<UserModel>? users}) {
    _log.i('adding users');
    Batch batch = _databaseService.database!.batch();
    for (var element in users!) {
      batch.insert(_userTable, element.toJson());
    }
    return batch.commit(noResult: true);
  }
}
