import 'package:nesma/features/help_center/presentation/functions/group_messages.dart';

class MockChatMessageModel {
  final String text;
  final int senderId;
  final String userName;
  final DateTime sentTime;
  final String userProfile;

  MockChatMessageModel({
    required this.userName,
    required this.senderId,
    required this.text,
    required this.sentTime,
    required this.userProfile,
  });
}

const int mockCurrentUserId = 1;

final List<MessageGroup> mockMessageGroups = groupMessages(messages);

final List<MockChatMessageModel> messages = <MockChatMessageModel>[
  
  MockChatMessageModel(
    senderId: 2,
    userProfile: '',
    text: 'Hope like it! ',
    sentTime: DateTime.now().subtract(const Duration(minutes: 10)),
    userName: 'Khaled Ahmad',
  ),
  MockChatMessageModel(
    senderId: 2,
    userProfile: '',
    text: 'مرحبا كيف الحال',
    userName: 'Khaled Ahmad',
    sentTime: DateTime.now().subtract(const Duration(minutes: 10)),
  ),
  MockChatMessageModel(
    senderId: mockCurrentUserId,
    userProfile: '',
    text: 'ماذا تفعل اليوم ',
    userName: 'Ali Ahmad',
    sentTime: DateTime.now().subtract(const Duration(minutes: 7)),
  ),
  MockChatMessageModel(
    senderId: 2,
    userProfile: '',
    text: 'حبيب القلب ',
    userName: 'Khaled Ahmad',
    sentTime: DateTime.now().subtract(const Duration(minutes: 6)),
  ),
  MockChatMessageModel(
    senderId: mockCurrentUserId,
    userProfile: '',
    text: 'Hello Khaled Ahmed! ',
    userName: 'Ali Ahmad',
    sentTime: DateTime.now().subtract(const Duration(minutes: 5)),
  ),
];

MockChatMessageModel createNewMessage(String text) {
  return MockChatMessageModel(
    senderId: mockCurrentUserId,
    text: text,
    sentTime: DateTime.now(),
    userProfile: 'https://example.com/user_profile_image_url.jpg',
    userName: '',
  );
}
