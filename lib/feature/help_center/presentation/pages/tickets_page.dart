import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nesma/core/common/bloc/app_manager_cubit.dart';
import 'package:nesma/core/common/widgets/app_bar/nesma_app_bar.dart';
import 'package:nesma/core/common/widgets/background_widget.dart';
import 'package:nesma/core/extension/string_extension.dart';
import 'package:nesma/features/help_center/presentation/mock/tickets.dart';
import 'package:nesma/features/help_center/presentation/widgets/ticket_widget.dart';

class TicketsPage extends StatelessWidget {
  const TicketsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppManagerCubit, AppManagerState>(
        builder: (context, state) {
      return Scaffold(
        extendBodyBehindAppBar: true,
        appBar:  NesmaAppbar(pageName: 'tickets'.tr),
        body: BackgroundWidget(
          child: ListView.builder(
            itemCount: tickets.length,
            itemBuilder: (context, index) => TicketItem(ticket: tickets[index]),
          ),
        ),
      );
    });
  }
}


