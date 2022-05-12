import 'dart:async';

import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../core/app/app.locator.dart';
import '../../../core/app/app.logger.dart';
import '../../../core/app/app.router.dart';
import '../../../core/services/database_service.dart';

class SplashViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final _databaseService = locator<DatabaseService>();
  final log = getLogger('SplashViewModel');

  void _moveToWrapper() {
    log.i('routing to home');
    _navigationService.clearStackAndShow(Routes.wrapperView);
  }

  Future _initialise() async {
    log.i('database invoked from splash view');
    await _databaseService.initialise();
    _moveToWrapper();
  }

  void handleStartUp() async {
    log.i('startup logic invoked');
    Duration _duration = const Duration(seconds: 3);
    Timer(_duration, _initialise);
  }
}
