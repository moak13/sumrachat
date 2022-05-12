import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../core/models/conversation_model.dart';
import '../../core/models/user_model.dart';
import '../../core/shared_widgets/custom_search_bar.dart';
import 'view_model/chat_viewmodel.dart';
import 'widgets/message_tile.dart';
import 'widgets/send_button.dart';

class ChatView extends StatelessWidget {
  final UserModel? userModel;
  ChatView({Key? key, this.userModel}) : super(key: key);

  final TextEditingController _controller = TextEditingController();
  final FocusNode _focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ChatViewModel>.reactive(
      viewModelBuilder: () => ChatViewModel(),
      onModelReady: (model) => model.getConversations(id: userModel?.id),
      builder: (
        BuildContext context,
        ChatViewModel model,
        Widget? child,
      ) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            leading: BackButton(
              color: Colors.blue,
              onPressed: model.back,
            ),
            title: ListTile(
              leading: Image.asset(
                '${userModel?.image}',
                height: 36,
                width: 36,
                fit: BoxFit.cover,
              ),
              title: Text(
                '${userModel?.fullName}',
                style: const TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 17,
                  color: Colors.black,
                ),
              ),
              subtitle: Text(
                'online',
                style: TextStyle(
                  fontWeight: FontWeight.w300,
                  fontSize: 13,
                  color: Colors.grey[400],
                ),
              ),
            ),
            elevation: 0,
            actions: [
              IconButton(
                onPressed: () {},
                icon: Image.asset(
                  'assets/png/phone.png',
                  height: 23,
                  width: 23,
                  fit: BoxFit.contain,
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: Image.asset(
                  'assets/png/video.png',
                  height: 23,
                  width: 23,
                  fit: BoxFit.contain,
                ),
              ),
            ],
          ),
          body: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: model.conversationsList.isEmpty
                    ? const Center(
                        child: Text('No Conversation Yet!'),
                      )
                    : ListView.separated(
                        itemCount: model.conversationsList.length,
                        padding: const EdgeInsets.only(
                          left: 10,
                          right: 10,
                          bottom: 10,
                          top: 10,
                        ),
                        itemBuilder: (c, i) {
                          final chat = model.conversationsList.elementAt(i);
                          return MessageTile(
                            message: '${chat.message}',
                            isMe: chat.isReallyMe,
                          );
                        },
                        separatorBuilder: (c, i) {
                          return const SizedBox(
                            height: 10,
                          );
                        },
                      ),
              ),
              Container(
                height: 74,
                padding: const EdgeInsets.only(
                  left: 17,
                  right: 17,
                ),
                color: Colors.white,
                alignment: Alignment.center,
                child: Row(
                  children: [
                    Expanded(
                      child: CustomSearchBar(
                        placeholder: 'type your message...',
                        controller: _controller,
                        focusNode: _focusNode,
                        isNotSearch: true,
                      ),
                    ),
                    SendButton(
                      onTap: () {
                        model.addConversation(
                            conversationModel: ConversationModel(
                          fullName: userModel?.fullName,
                          image: userModel?.image,
                          userId: userModel?.id,
                          firstName: userModel?.firstName,
                          lastName: userModel?.lastName,
                          message: _controller.text.trim(),
                          isMe: 1,
                        ));
                        _controller.clear();
                      },
                    ),
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
