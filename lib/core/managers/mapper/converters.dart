import 'dart:ui';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:nesma/core/managers/mapper/mapper.dart';
import 'package:nesma/features/home/data/models/store_in_category_model.dart';
import 'package:nesma/features/home/domain/entities/soter_in_category.dart';
import 'package:nesma/features/purchases/data/models/instalment_details.dart';
import 'package:nesma/features/purchases/data/models/order_item_model.dart';
import 'package:nesma/features/purchases/domain/entities/instalment_details_entity.dart';
import 'package:nesma/features/purchases/domain/entities/order_item.dart';

class ConvertStoreInCategory
    extends JsonConverter<StoreInCategoryEntity, Map<String, dynamic>> {
  const ConvertStoreInCategory();

  @override
  StoreInCategoryEntity fromJson(Map<String, dynamic> json) =>
      StoreInCategoryModel.fromJson(json);

  @override
  Map<String, dynamic> toJson(StoreInCategoryEntity object) =>
      (object as StoreInCategoryModel).toJson();
}

class ConvertInstalmentDetails
    extends JsonConverter<InstallmentDetailEntity, Map<String, dynamic>> {
  const ConvertInstalmentDetails();

  @override
  InstallmentDetailEntity fromJson(Map<String, dynamic> json) =>
      InstalmentDetailsModel.fromJson(json);

  @override
  Map<String, dynamic> toJson(InstallmentDetailEntity object) =>
      (object as InstalmentDetailsModel).toJson();
}

class OrderItemModelConverter extends JsonConverter<OrderItemEntity, Map<String, dynamic>> {
  const OrderItemModelConverter();

  @override
  OrderItemEntity fromJson(Map<String, dynamic> json) =>
      OrderItemModel.fromJson(json);

  @override
  Map<String, dynamic> toJson(OrderItemEntity object) =>
      (object as  OrderItemModel).toJson();
}


class ColorModelConverter extends JsonConverter<Color ,String> {
  const ColorModelConverter();

  @override
  Color fromJson(String json) =>
      Mapper.toColor(json);

  @override
  String toJson(Color object) =>
      object.toString();
}
