import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nesma/core/common/bloc/app_manager_cubit.dart';
import 'package:nesma/core/common/widgets/app_bar/nesma_app_bar.dart';
import 'package:nesma/core/extension/string_extension.dart';
import 'package:nesma/features/help_center/presentation/managers/chat_cubit/chat_cubit.dart';
import 'package:nesma/features/help_center/presentation/widgets/chat_page_content.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppManagerCubit, AppManagerState>(
        builder: (context, state) {
      return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: NesmaAppbar(pageName: 'help_center'.tr),
        body: BlocProvider(
            create: (context) => ChatCubit(), child: const ChatPageContent()),
      );
    });
  }
}
