abstract class NewsStates{}
class NewsIntialState extends NewsStates{}

class ChangeBotNavState extends NewsStates{}

class NewsGetBusinessDataSuccess extends NewsStates{}
class NewsGetBusinessDataError extends NewsStates{
  final String error;
  NewsGetBusinessDataError(this.error);
}
class NewsBusinessLoading extends NewsStates{}

class NewsGetSportDataSuccess extends NewsStates{}
class NewsGetSportDataError extends NewsStates{
  final String error;
  NewsGetSportDataError(this.error);
}
class NewsSportLoading extends NewsStates{}


class NewsGetScienceDataSuccess extends NewsStates{}
class NewsGetScienceDataError extends NewsStates{
  final String error;
  NewsGetScienceDataError(this.error);
}
class NewsScienceLoading extends NewsStates{}

class NewsGetSearchDataSuccess extends NewsStates{}
class NewsGetSearchDataError extends NewsStates{
  final String error;
  NewsGetSearchDataError(this.error);
}
class NewsSearchLoading extends NewsStates{}

