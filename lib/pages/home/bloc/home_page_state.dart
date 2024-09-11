import 'package:dog_seo_app/api/api_response.dart';

import '../../../data/breeds.dart';

abstract class HomePageState {}

class HomePageStateLoading extends HomePageState {}

class HomePageStateError extends HomePageState {
  HomePageStateError(this.error);

  final APIResponseError error;
}

class HomePageStateSuccess extends HomePageState {
  HomePageStateSuccess(this.breeds);

  final Breeds breeds;
}
