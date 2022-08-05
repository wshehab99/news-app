abstract class AppStates {}

class InintialAppState extends AppStates {}

class BottomNavigationState extends AppStates {}

class LoadingState extends AppStates {}

class BusinessGetSuccessState extends AppStates {}

class BusinessGetErrorState extends AppStates {
  BusinessGetErrorState(String errer);
}
