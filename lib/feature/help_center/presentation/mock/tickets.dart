
import 'package:flutter/material.dart';

class TicketMockModel {
  const TicketMockModel(
      {required this.id,
      required this.issue,
      required this.status,
      required this.creatdAt});

  final String id;
  final String issue;
  final TicketStatus status;
  final String creatdAt;
}

List<TicketMockModel> tickets = [
  const TicketMockModel(
    id: '#SA4522352312',
    issue: 'order',
    creatdAt: '2023/20/12',
    status: TicketStatus.open,
  ),
  const TicketMockModel(
    id: '#SA932222352312',
    issue: 'payment',
    creatdAt: '2023/17/12',
    status: TicketStatus.pending,
  ),
  const TicketMockModel(
    id: '#SA324452312',
    issue: 'payment',
    creatdAt: '2023/10/12',
    status: TicketStatus.recivid,
  ),
];

Color getStatusColor(TicketStatus status) {
  switch (status) {
    case TicketStatus.open:
      return Colors.blue;

    case TicketStatus.pending:
      return Colors.grey;

    case TicketStatus.recivid:
      return Colors.green;
  }
}

enum TicketStatus { open, pending, recivid }
