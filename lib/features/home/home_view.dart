import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../core/models/user_model.dart';
import '../../core/shared_widgets/custom_app_bar.dart';
import '../../core/shared_widgets/custom_icon_button.dart';
import '../../core/shared_widgets/custom_search_bar.dart';
import 'view_model/home_viewmodel.dart';
import 'widgets/message_list.dart';
import 'widgets/status_list.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
      onModelReady: (model) {
        model.getUserList();
      },
      viewModelBuilder: () => HomeViewModel(),
      builder: (
        BuildContext context,
        HomeViewModel model,
        Widget? child,
      ) {
        return Scaffold(
          appBar: CustomAppBar(
            title: 'Chats',
            actions: [
              CustomIconButton(
                iconData: Icons.camera_alt,
                icon: 'assets/png/cam.png',
                onTap: () {},
              ),
              const SizedBox(
                width: 5,
              ),
              CustomIconButton(
                iconData: Icons.edit_note,
                icon: 'assets/png/edit.png',
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
                    left: 15,
                    right: 15,
                  ),
                  child: CustomSearchBar(
                    placeholder: 'Search',
                    onChanged: (value) => model.search(value),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Stack(
                  children: [
                    SizedBox(
                      height: 100,
                      child: ListView.separated(
                        // shrinkWrap: true,
                        padding: const EdgeInsets.only(left: 100),
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (c, i) {
                          final user = model.userList.elementAt(i);
                          return StatusList(
                            image: '${user.image}',
                            name: '${user.firstName}',
                            onTap: () {
                              model.moveToChat(user);
                            },
                          );
                        },
                        separatorBuilder: (c, i) {
                          return const SizedBox.shrink();
                        },
                        itemCount: model.userList.length,
                      ),
                    ),
                    Container(
                      height: 100,
                      decoration: BoxDecoration(
                        color: Colors.grey[50],
                      ),
                      child: StatusList(
                        image: '',
                        name: 'Your story',
                        iconData: Icons.add,
                        onTap: () {},
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                Expanded(
                  child: model.messagesData.isEmpty
                      ? const Center(
                          child: Text('No Messages yet!'),
                        )
                      : model.searchMessageList.isNotEmpty
                          ? ListView.separated(
                              itemBuilder: (c, i) {
                                final message =
                                    model.searchMessageList.elementAt(i);
                                return MessageList(
                                  fullName: '${message.fullName}',
                                  image: '${message.image}',
                                  lastMessage: '${message.message}',
                                  onTap: () {
                                    model.moveToChat(UserModel(
                                      id: message.userId,
                                      image: message.image,
                                      firstName: message.firstName,
                                      lastName: message.lastName,
                                    ));
                                  },
                                );
                              },
                              separatorBuilder: (c, i) {
                                return const SizedBox(
                                  height: 10,
                                );
                              },
                              itemCount: model.searchMessageList.length,
                            )
                          : ListView.separated(
                              itemBuilder: (c, i) {
                                final message = model.messagesData.elementAt(i);
                                return MessageList(
                                  fullName: '${message.fullName}',
                                  image: '${message.image}',
                                  lastMessage: '${message.message}',
                                  onTap: () {
                                    model.moveToChat(UserModel(
                                      id: message.userId,
                                      image: message.image,
                                      firstName: message.firstName,
                                      lastName: message.lastName,
                                    ));
                                  },
                                );
                              },
                              separatorBuilder: (c, i) {
                                return const SizedBox(
                                  height: 10,
                                );
                              },
                              itemCount: model.messagesData.length,
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
