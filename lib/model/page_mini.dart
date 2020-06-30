import 'package:flutter/material.dart';
import 'package:flutter_widget_project/model/page_option_model.dart';

class PageMini {
  ScrollController pageScrollController = new ScrollController();
  bool isPageLoading = false;

  PageResultModel pageResultModel = new PageResultModel.empty();
  PageOptionModel pageOptionModel = new PageOptionModel.empty();

  initPage() {
    if(pageScrollController != null){
      pageScrollController.addListener(() {
        if (pageScrollController.position.pixels >=
            pageScrollController.position.maxScrollExtent  && !isPageLoading) {
          isPageLoading = true;
          loadMoreData();
        }
        if (pageScrollController.position.pixels ==
            pageScrollController.position.minScrollExtent && !isPageLoading) {
          isPageLoading = true;
          refreshData();
        }
      });
    }
  }


  @protected
  refreshData() {}

  @protected
  loadMoreData() {}
}