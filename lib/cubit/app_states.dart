abstract class AppStates {}

class InintialAppState extends AppStates {}

class BottomNavigationState extends AppStates {}

class LoadingState extends AppStates {}

class BusinessGetSuccessState extends AppStates {}

class BusinessGetErrorState extends AppStates {
  BusinessGetErrorState(String errer);
}

class SportGetSuccessState extends AppStates {}

class SportGetErrorState extends AppStates {
  SportGetErrorState(String errer);
}

class ScienceGetSuccessState extends AppStates {}

class ScienceGetErrorState extends AppStates {
  ScienceGetErrorState(String errer);
}

class ChangeAppModeState extends AppStates {}

class SearchGetSuccessState extends AppStates {}

class SearchGetErrorState extends AppStates {
  SearchGetErrorState(String errer);
}
