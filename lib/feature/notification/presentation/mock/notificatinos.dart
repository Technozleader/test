class NotificationMockModel {
  final String content;
  final DateTime date;

  const NotificationMockModel(
    this.content,
    this.date,
  );
}

final List<NotificationMockModel> notificationMockModels = List.generate(
    5,
    (index) => NotificationMockModel(
        'content content content content content '
            'content content content content content content',
        DateTime.now()));
