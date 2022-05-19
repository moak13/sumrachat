import 'package:sqflite_migration_service/sqflite_migration_service.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:sumrachat/features/login/login_view.dart';

import '../../features/chat/chat_view.dart';
import '../../features/splash/splash_view.dart';
import '../../features/wrapper/wrapper_view.dart';
import '../services/database_service.dart';
import '../stores/conversation_store.dart';
import '../stores/message_store.dart';
import '../stores/user_store.dart';

@StackedApp(
  routes: [
    AdaptiveRoute(
      page: SplashView,
      initial: true,
    ),
    AdaptiveRoute(
      page: LoginView,
    ),
    AdaptiveRoute(
      page: WrapperView,
    ),
    AdaptiveRoute(
      page: ChatView,
    ),
  ],
  dependencies: [
    Singleton(classType: NavigationService),
    Singleton(classType: DatabaseMigrationService),
    Singleton(classType: DatabaseService),
    LazySingleton(classType: UserStore),
    LazySingleton(classType: MessageStore),
    LazySingleton(classType: ConversationStore),
  ],
  logger: StackedLogger(),
)
class AppSetup {}
