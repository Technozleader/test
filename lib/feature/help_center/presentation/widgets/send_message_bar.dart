import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nesma/core/extension/string_extension.dart';
import 'package:nesma/core/managers/size_manager/font_size_manager.dart';
import 'package:nesma/core/managers/theme_manager/text_theme.dart';
import 'package:nesma/features/help_center/presentation/managers/chat_cubit/chat_cubit.dart';
import 'package:sizer/sizer.dart';

class SendMessageBar extends StatelessWidget {
  const SendMessageBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final TextEditingController textController = TextEditingController();
    final chatCubit = context.read<ChatCubit>();

    void handleSendMessage(String text) {
      chatCubit.sendMessage(text);
      textController.clear();
    }

    return Container(
        height: 10.h,
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(4),
        ),
        child: IconTheme(
          data: IconThemeData(color: Theme.of(context).cardColor),
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Flexible(
                  child: Container(
                    width: 65.w,
                    height: 5.h,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: TextField(
                          style: TextManager.label1.copyWith(
                            fontWeight: FontWeight.w100,
                            fontSize: FontSizeManager.s12,
                            letterSpacing: 0.02,
                          ),
                          controller: textController,
                          onSubmitted: handleSendMessage,
                          decoration: InputDecoration.collapsed(
                            hintText: 'write_your_message'.tr,
                            hintStyle: TextManager.label1.copyWith(
                              fontWeight: FontWeight.w100,
                              fontSize: FontSizeManager.s12,
                              letterSpacing: 0.02,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  width: 12.w,
                  height: 5.h,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.black,
                  ),
                  child: IconButton(
                    icon: const Icon(Icons.send),
                    onPressed: () => handleSendMessage(textController.text),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
