abstract class HomeTabState{}

class HomeInitialState extends HomeTabState{}

class HomeTabCategoryLoadingState extends HomeTabState{
  String? loadingMessage;
  HomeTabCategoryLoadingState({this.loadingMessage});
}

class HomeTabCategoryErrorState extends HomeTabState{
  String? errorMessage;
  HomeTabCategoryErrorState({this.errorMessage});
}

class HomeTabCategorySuccessState extends HomeTabState{}

