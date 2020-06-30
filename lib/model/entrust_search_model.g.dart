// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'entrust_search_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Map<String, dynamic> _$EntrustSearchRequestModelToJson(
        EntrustSearchRequestModel instance) =>
    <String, dynamic>{
      'EntrustType': instance.EntrustType,
      'EntrustStatus': instance.EntrustStatus,
      'SearchType': instance.SearchType,
      'MemberId': instance.MemberId,
      'PagingOption': instance.PagingOption,
    };

EntrustListModel _$EntrustListModelFromJson(Map<String, dynamic> json) {
  return EntrustListModel(
    Data: (json['Data'] as List)
        ?.map((e) =>
            e == null ? null : EntrustModel.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    PagingResult: json['PagingResult'] == null
        ? null
        : PageResultModel.fromJson(
            json['PagingResult'] as Map<String, dynamic>),
  );
}

EntrustModel _$EntrustModelFromJson(Map<String, dynamic> json) {
  return EntrustModel(
    Id: json['Id'] as String,
    ShopId: json['ShopId'] as String,
  );
}
