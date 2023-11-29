import 'package:flutter/material.dart';
import 'package:nesma/core/extension/formatter.dart';
import 'package:nesma/core/extension/string_extension.dart';
import 'package:nesma/core/managers/size_manager/font_size_manager.dart';
import 'package:nesma/core/managers/theme_manager/text_theme.dart';
import 'package:nesma/features/help_center/presentation/functions/group_messages.dart';
import 'package:sizer/sizer.dart';

class GroupMessagesItem extends StatelessWidget {
  const GroupMessagesItem({
    super.key,
    required this.groupMessages,
  });
  final MessageGroup groupMessages;
  @override
  Widget build(BuildContext context) {
    List<Widget> widgetsOfMesssagesGroupItem = [
      Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: groupMessages.userProfile
                .toImage(height: 40, width: 40, fit: BoxFit.fill),
          )),
      Column(
        crossAxisAlignment: isMessageForCurrentUser(groupMessages.senderId)
            ? CrossAxisAlignment.end
            : CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            groupMessages.userName,
            style: TextManager.label1.copyWith(
              fontWeight: FontWeight.w400,
              fontSize: FontSizeManager.s14,
              letterSpacing: 0.02,
            ),
          ),
          ...List.generate(groupMessages.messages.length, (index) {
            final message = groupMessages.messages[index].text;
            return Container(
              decoration: getRightDicorationForMessageBubble(
                  isMessageForCurrentUser(groupMessages.senderId)),
              margin: const EdgeInsets.only(top: 5.0),
              padding: const EdgeInsets.all(8),
              child: Text(
                message,
                textDirection: TextDirection.ltr,
                textAlign: TextAlign.right,
                style: TextManager.label1.copyWith(
                  fontWeight: FontWeight.w100,
                  fontSize: FontSizeManager.s12,
                  color: getRightColorForMessageText(
                      isMessageForCurrentUser(groupMessages.senderId)),
                  letterSpacing: 0.02,
                ),
              ),
            );
          }).reversed,
          SizedBox(
            height: 1.h,
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Text(
              groupMessages.sentTime.formatToHHmmAMPM,
              textDirection: TextDirection.ltr,
              style: TextManager.label1.copyWith(
                fontWeight: FontWeight.w100,
                fontSize: FontSizeManager.s10,
                letterSpacing: 0.02,
              ),
            ),
          ),
        ],
      ),
    ];

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        mainAxisAlignment: isMessageForCurrentUser(groupMessages.senderId)
            ? MainAxisAlignment.end
            : MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: isMessageForCurrentUser(groupMessages.senderId)
            ? widgetsOfMesssagesGroupItem.reversed.toList()
            : widgetsOfMesssagesGroupItem,
      ),
    );
  }
}
