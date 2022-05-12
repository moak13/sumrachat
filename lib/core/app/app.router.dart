// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedRouterGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';

import '../../features/chat/chat_view.dart';
import '../../features/splash/splash_view.dart';
import '../../features/wrapper/wrapper_view.dart';
import '../models/user_model.dart';

class Routes {
  static const String splashView = '/';
  static const String wrapperView = '/wrapper-view';
  static const String chatView = '/chat-view';
  static const all = <String>{
    splashView,
    wrapperView,
    chatView,
  };
}

class StackedRouter extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.splashView, page: SplashView),
    RouteDef(Routes.wrapperView, page: WrapperView),
    RouteDef(Routes.chatView, page: ChatView),
  ];
  @override
  Map<Type, StackedRouteFactory> get pagesMap => _pagesMap;
  final _pagesMap = <Type, StackedRouteFactory>{
    SplashView: (data) {
      return buildAdaptivePageRoute<dynamic>(
        builder: (context) => const SplashView(),
        settings: data,
      );
    },
    WrapperView: (data) {
      return buildAdaptivePageRoute<dynamic>(
        builder: (context) => const WrapperView(),
        settings: data,
      );
    },
    ChatView: (data) {
      var args = data.getArgs<ChatViewArguments>(
        orElse: () => ChatViewArguments(),
      );
      return buildAdaptivePageRoute<dynamic>(
        builder: (context) => ChatView(
          key: args.key,
          userModel: args.userModel,
        ),
        settings: data,
      );
    },
  };
}

/// ************************************************************************
/// Arguments holder classes
/// *************************************************************************

/// ChatView arguments holder class
class ChatViewArguments {
  final Key? key;
  final UserModel? userModel;
  ChatViewArguments({this.key, this.userModel});
}
