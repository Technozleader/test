import 'package:flutter/material.dart';
import 'package:nesma/core/common/widgets/app_bar/nesma_app_bar.dart';
import 'package:nesma/core/common/widgets/background_widget.dart';
import 'package:nesma/features/notification/presentation/mock/notificatinos.dart';
import 'package:nesma/features/notification/presentation/widgets/notification_component.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: const NesmaAppbar(pageName: 'Notfications'),
      body: BackgroundWidget(
        child: ListView.builder(
          itemBuilder: (context, index) =>NotificationComponent(
            notificationMockModel: notificationMockModels[index],
          ),
          itemCount: notificationMockModels.length
        ),
      ),
    );
  }
}
