import 'package:equatable/equatable.dart';
import 'package:nesma/features/help_center/presentation/functions/group_messages.dart';

class ChatState extends Equatable {
  final List<MessageGroup> messagesGroups;


  const ChatState(this.messagesGroups);

  @override
  List<Object?> get props => [messagesGroups];

  ChatState copyWith({List<MessageGroup>? messageGroups}) {
    return ChatState(messageGroups ?? messagesGroups);
  }
}
