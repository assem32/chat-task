abstract class HomeViewStates{}

class HomeViewInitState extends HomeViewStates{}
class HomeViewLoadingState extends HomeViewStates{}
class HomeViewSuccessState extends HomeViewStates{}
class GetDataSuccess extends HomeViewStates{}
class HomeViewErrorState extends HomeViewStates{
  final String error;
  HomeViewErrorState(this.error);
}

