import 'package:sqflite/sqlite_api.dart';
import 'package:stacked/stacked.dart';

import '../app/app.locator.dart';
import '../app/app.logger.dart';
import '../models/user_model.dart';
import '../services/database_service.dart';

const String _userTable = 'user';

class UserStore extends BaseViewModel {
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

  Future<void> addUser({UserModel? user}) async {
    _log.i('adding user');
    await _databaseService.database!.insert(_userTable, user!.toJson());
    notifyListeners();
  }

  Future<UserModel?> getUser() async {
    /// Kindly note that is_authenticated is a local data handling from the logic side of things
    var records = await _databaseService.database!
        .query(_userTable, where: "is_authenticated = ?", whereArgs: [1]);
    if ((records).isEmpty) {
      return null;
    }

    return UserModel.fromJson(records.first);
  }
}
