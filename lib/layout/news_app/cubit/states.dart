abstract class NewsStates{}

class NewsInitialState extends NewsStates{}

class NewsBottomNavState extends NewsStates{}
////////////////////////////////////////////////////////////////////////

class NewsGetBusinessSuccessState extends NewsStates{}

class NewsGetBusinessErrorState extends NewsStates{
  final error;
  NewsGetBusinessErrorState(this.error);
}

class NewsGetBusinessLoadingState extends NewsStates{}
////////////////////////////////////////////////////////////////////////
class NewsGetSportsSuccessState extends NewsStates{}

class NewsGetSportsErrorState extends NewsStates{
  final error;
  NewsGetSportsErrorState(this.error);
}

class NewsGetSportsLoadingState extends NewsStates{}
////////////////////////////////////////////////////////////////////////
class NewsGetSciencesSuccessState extends NewsStates{}

class NewsGetScienceErrorState extends NewsStates{
  final error;
  NewsGetScienceErrorState(this.error);
}

class NewsGetScienceLoadingState extends NewsStates{}
////////////////////////////////////////////////////////////////////////
class AppChangeModeState extends NewsStates{}
////////////////////////////////////////////////////////////////////////
class NewsGetSearchSuccessState extends NewsStates{}

class NewsGetSearchErrorState extends NewsStates{
  final error;
  NewsGetSearchErrorState(this.error);
}

class NewsGetSearchLoadingState extends NewsStates{}
////////////////////////////////////////////////////////////////////////
