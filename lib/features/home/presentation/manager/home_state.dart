part of 'home_bloc.dart';

class HomeState extends Equatable {
  final List<News> newsList;
  final String getAllNewsMessage;
  final RequestState getAllNewsState;

  const HomeState({
    this.newsList = const [],
    this.getAllNewsMessage = "",
    this.getAllNewsState = RequestState.idle,
  });
  HomeState copyWith({
    List<News>? newsList,
    RequestState? getAllNewsState,
    String? getAllNewsMessage,
  }) {
    return HomeState(
        newsList: newsList ?? this.newsList,
        getAllNewsMessage: getAllNewsMessage ?? this.getAllNewsMessage,
        getAllNewsState: getAllNewsState ?? this.getAllNewsState);
  }

  @override
  // TODO: implement props
  List<Object?> get props => [newsList, getAllNewsMessage, getAllNewsState];
}
