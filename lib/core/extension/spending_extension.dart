import 'package:nesma/features/spendings_page/domain/entities/spending_entity.dart';
import 'package:nesma/features/spendings_page/presentation/page/spendings_page.dart';

extension SpendingExtension on SpendingEntity{
  ChartData get toChartData =>
      ChartData(name: name,
        percent: percentage,
        color: rgbColor,
        money: total,);
}