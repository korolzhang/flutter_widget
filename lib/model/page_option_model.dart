// ignore_for_file: non_constant_identifier_names,library_prefixes

import 'package:json_annotation/json_annotation.dart';

part 'page_option_model.g.dart';

class PageOptionModel {
  int GotoPageNumber = 1;
  int PageSize = 15;
  List OrderBy;
  bool isFirstPage = true;
  bool isLoading = true;

  PageOptionModel({this.GotoPageNumber, this.PageSize, this.OrderBy});

  PageOptionModel.forGotoPageNumber(this.GotoPageNumber, {this.OrderBy});

  PageOptionModel.empty();

  int firstPage() {
    this.GotoPageNumber = 1;
    isFirstPage = true;
    isLoading = true;
    return this.GotoPageNumber;
  }

  int nextPage() {
    isFirstPage = false;
    isLoading = true;
    return this.GotoPageNumber++;
  }

  Map<String, dynamic> toJson() => _$PageOptionModelToJson(this);

  Map<String, dynamic> _$PageOptionModelToJson(PageOptionModel instance) =>
      <String, dynamic>{
        'GotoPageNumber': instance.GotoPageNumber,
        'PageSize': instance.PageSize,
        'OrderBy': instance.OrderBy,
      };
}

@JsonSerializable(createToJson: false,nullable:false)
class PageResultModel {
  String PagingMode;
  String TotalSize;
  String PageSize;
  String CurrentPage;
  String ShowFrom;
  String ShowTo;
  bool HasNextPage = true;

  PageResultModel(
    this.PagingMode,
    this.TotalSize,
    this.PageSize,
    this.CurrentPage,
    this.ShowFrom,
    this.ShowTo,
    this.HasNextPage,
  );

  PageResultModel.empty();

  factory PageResultModel.fromJson(Map<String, dynamic> json) =>
      _$PageResultModelFromJson(json);
}

class PageControlModel {
  PageResultModel pageResultModel = new PageResultModel.empty();
  PageOptionModel pageOptionModel = new PageOptionModel.empty();
}
