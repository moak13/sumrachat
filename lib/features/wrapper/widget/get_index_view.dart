import 'package:flutter/material.dart';

import '../../home/home_view.dart';
import '../../people/people_view.dart';
import '../../settings/settings_view.dart';

class GetIndexView extends StatelessWidget {
  final int index;
  const GetIndexView({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    switch (index) {
      case 0:
        return const HomeView();
      case 1:
        return const PeopleView();
      case 2:
        return const SettingsView();
      default:
        return const HomeView();
    }
  }
}
