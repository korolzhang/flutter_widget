// ignore_for_file: non_constant_identifier_names,library_prefixes
import 'package:flutter_widget_project/model/page_option_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'entrust_search_model.g.dart';

/*
*委托单搜索
* */
@JsonSerializable(createFactory: false, nullable: false)
class EntrustSearchRequestModel {
  final int EntrustType;
  final int EntrustStatus;
  final int SearchType;
  final String MemberId;
  final Map PagingOption;

  EntrustSearchRequestModel({
    this.EntrustType,
    this.EntrustStatus,
    this.SearchType,
    this.MemberId,
    this.PagingOption,
  });

  Map<String, dynamic> toJson() => _$EntrustSearchRequestModelToJson(this);
}


@JsonSerializable(createToJson: false)
class EntrustListModel{
  final List<EntrustModel> Data;
  final PageResultModel PagingResult;

  EntrustListModel({this.Data, this.PagingResult});

  factory EntrustListModel.fromJson(Map<String, dynamic> json) =>
      _$EntrustListModelFromJson(json);

  EntrustListModel from(Map<String, dynamic> json) => _$EntrustListModelFromJson(json);
}

@JsonSerializable(createToJson: false)
class EntrustModel {
  final String Id;
  final String ShopId;


  EntrustModel({
    this.Id,
    this.ShopId,

  });

  factory EntrustModel.fromJson(Map<String, dynamic> json) =>
      _$EntrustModelFromJson(json);

  EntrustModel from(Map<String, dynamic> json) => _$EntrustModelFromJson(json);
}
