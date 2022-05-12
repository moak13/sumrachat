import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../core/shared_widgets/custom_app_bar.dart';
import '../../core/shared_widgets/custom_icon_button.dart';
import '../../core/shared_widgets/custom_search_bar.dart';
import 'view_model/people_viewmodel.dart';
import 'widgets/active_list.dart';

class PeopleView extends StatelessWidget {
  const PeopleView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<PeopleViewModel>.reactive(
      viewModelBuilder: () => PeopleViewModel(),
      onModelReady: (model) => model.getUserList(),
      builder: (
        BuildContext context,
        PeopleViewModel model,
        Widget? child,
      ) {
        return Scaffold(
          appBar: CustomAppBar(
            title: 'People',
            actions: [
              CustomIconButton(
                iconData: CupertinoIcons.chat_bubble_fill,
                icon: 'assets/png/dotted_chat.png',
                onTap: () {},
              ),
              const SizedBox(
                width: 5,
              ),
              CustomIconButton(
                iconData: CupertinoIcons.person_add_solid,
                icon: 'assets/png/add_contact.png',
                onTap: () {},
              ),
            ],
          ),
          body: GestureDetector(
            onTap: () => _closeKeyboard(context),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    left: 16,
                    right: 16,
                  ),
                  child: CustomSearchBar(
                    placeholder: 'Search',
                    onChanged: (value) => model.search(value),
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 16,
                  ),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Recently active',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 13,
                        color: Colors.grey[400],
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Expanded(
                  child: model.searchUserList.isNotEmpty
                      ? ListView.separated(
                          itemBuilder: (c, i) {
                            final user = model.searchUserList.elementAt(i);
                            return ActiveList(
                              fullName: user.fullName,
                              image: '${user.image}',
                              onTap: () {
                                model.moveToChat(user);
                              },
                            );
                          },
                          separatorBuilder: (c, i) {
                            return const SizedBox(
                              height: 3,
                            );
                          },
                          itemCount: model.searchUserList.length,
                        )
                      : ListView.separated(
                          itemBuilder: (c, i) {
                            final user = model.userList.elementAt(i);
                            return ActiveList(
                              fullName: user.fullName,
                              image: '${user.image}',
                              onTap: () {
                                model.moveToChat(user);
                              },
                            );
                          },
                          separatorBuilder: (c, i) {
                            return const SizedBox(
                              height: 3,
                            );
                          },
                          itemCount: model.userList.length,
                        ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _closeKeyboard(BuildContext context) {
    FocusScope.of(context).unfocus();
  }
}
