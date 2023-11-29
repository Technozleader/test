import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nesma/core/common/widgets/background_widget.dart';
import 'package:nesma/features/help_center/presentation/managers/chat_cubit/chat_cubit.dart';
import 'package:nesma/features/help_center/presentation/managers/chat_cubit/chat_state.dart';
import 'package:nesma/features/help_center/presentation/widgets/group_messages_item.dart';
import 'package:nesma/features/help_center/presentation/widgets/send_message_bar.dart';

class ChatPageContent extends StatelessWidget {
  const ChatPageContent({super.key});

  @override
  Widget build(BuildContext context) {
    return BackgroundWidget(
      child: Column(
        children: <Widget>[
          Flexible(
            child: BlocBuilder<ChatCubit, ChatState>(
              builder: (context, chatState) {
                return ListView.builder(
                  reverse: true,
                  padding: const EdgeInsets.all(8.0),
                  itemBuilder: (context, index) {
                    return GroupMessagesItem(
                      groupMessages: chatState.messagesGroups[index],
                    );
                  },
                  itemCount: chatState.messagesGroups.length,
                );
              },
            ),
          ),
          const SendMessageBar(),
        ],
      ),
    );
  }
}
