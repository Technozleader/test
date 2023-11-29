import 'package:bloc/bloc.dart';
import 'package:nesma/features/help_center/presentation/functions/group_messages.dart';
import 'package:nesma/features/help_center/presentation/managers/chat_cubit/chat_state.dart';
import 'package:nesma/features/help_center/presentation/mock/chat_messages.dart';

class ChatCubit extends Cubit<ChatState> {
  ChatCubit() : super(ChatState(mockMessageGroups));

  void sendMessage(String text) {
    final newMessage = createNewMessage(text);

    final List<MessageGroup> updatedGroups =
        List<MessageGroup>.from(state.messagesGroups);

    // Check if there are any existing groups
    if (updatedGroups.isNotEmpty) {
      var lastGroup = updatedGroups[0];

      //check if the last group of messages is for current user
      if (lastGroup.senderId == mockCurrentUserId) {
        lastGroup = MessageGroup(
            userName: lastGroup.userName,
            senderId: lastGroup.senderId,
            userProfile: lastGroup.userProfile,
            sentTime: lastGroup.sentTime.isBefore(DateTime.now())
                ? DateTime.now()
                : lastGroup.sentTime,
            messages: lastGroup.messages..insert(0, newMessage));
      } else {
        final newGroup = createNewMessageGroup(newMessage);
        updatedGroups.insert(0, newGroup);
      }
    } else {
      final newGroup = createNewMessageGroup(newMessage);
      updatedGroups.insert(0, newGroup);
    }

    emit(state.copyWith(messageGroups: updatedGroups));
  }
}


