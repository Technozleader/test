import 'package:flutter/material.dart';
import 'package:nesma/core/common/bloc/app_manager_cubit.dart';
import 'package:nesma/core/managers/colors/color_manager.dart';
import 'package:nesma/core/service_locator.dart';
import 'package:nesma/features/help_center/presentation/mock/chat_messages.dart';

class MessageGroup {
  final String userName;
  final int senderId;
  final String userProfile;
  final DateTime sentTime;
  final List<MockChatMessageModel> messages;

  MessageGroup({
    required this.userName,
    required this.senderId,
    required this.userProfile,
    required this.sentTime,
    required this.messages,
  });
}

List<MessageGroup> groupMessages(List<MockChatMessageModel> messages) {
  List<MessageGroup> messageGroups = [];

  if (messages.isEmpty) {
    return messageGroups;
  }

  // Sort messages by user and sent time
  messages.sort((a, b) {
    return a.sentTime.compareTo(b.sentTime);
  });

  String currentUser = messages[0].userName;
  int currentUserId = messages[0].senderId;
  String currentUserProfile = messages[0].userProfile;
  DateTime currentSentTime = messages[0].sentTime;
  List<MockChatMessageModel> currentGroup = [messages[0]];

  for (int i = 1; i < messages.length; i++) {
    if (messages[i].senderId == currentUserId &&
        messages[i].sentTime.minute == currentSentTime.minute) {
      currentGroup.add(messages[i]);
    } else {
      // Create a new group
      messageGroups.add(MessageGroup(
        senderId: currentUserId,
        userName: currentUser,
        userProfile: currentUserProfile,
        sentTime: currentSentTime,
        messages: currentGroup,
      ));

      // Reset current user, profile, sent time, and group
      currentUser = messages[i].userName;
      currentUserProfile = messages[i].userProfile;
      currentSentTime = messages[i].sentTime;
      currentGroup = [messages[i]];
      currentUserId = messages[i].senderId;
    }
  }

  // Add the last group
  messageGroups.add(MessageGroup(
    userName: currentUser,
    senderId: currentUserId,
    userProfile: currentUserProfile,
    sentTime: currentSentTime,
    messages: currentGroup,
  ));
  return messageGroups;
}

MessageGroup createNewMessageGroup(MockChatMessageModel newMessage) {
  return MessageGroup(
    userName: 'Ali Ahmed',
    userProfile: 'https://example.com/profile_image_url.jpg',
    senderId: mockCurrentUserId,
    sentTime: DateTime.now(),
    messages: [newMessage],
  );
}

Decoration getMessageDecoration(bool isCurrentUser) {
  return BoxDecoration(
    color: isCurrentUser ? Colors.black : Colors.white,
    borderRadius: BorderRadius.only(
      bottomLeft: const Radius.circular(8),
      bottomRight: const Radius.circular(8),
      topLeft:
          isCurrentUser ? const Radius.circular(8) : const Radius.circular(0),
      topRight:
          isCurrentUser ? const Radius.circular(0) : const Radius.circular(8),
    ),
  );
}

getMessageTextColor(bool isCurrentUser) {
  return isCurrentUser ? ColorManager.white : ColorManager.black;
}

bool isMessageForCurrentUser(int senderId) {
  return senderId == mockCurrentUserId;
}

Decoration getRightDicorationForMessageBubble(bool isCurrentUser) {
  return getIt<AppManagerCubit>().locale.languageCode == 'en'
      ? getMessageDecoration(isCurrentUser)
      : getMessageDecoration(!isCurrentUser);
}

getRightColorForMessageText(bool isCurrentUser) {
  return getIt<AppManagerCubit>().locale.languageCode == 'en'
      ? getMessageTextColor(isCurrentUser)
      : getMessageTextColor(!isCurrentUser);
}
