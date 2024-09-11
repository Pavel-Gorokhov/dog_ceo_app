import 'package:dog_seo_app/api/api_response.dart';

abstract class DetailsPageState {}

class DetailsPageStateLoading extends DetailsPageState {}

class DetailsPageStateError extends DetailsPageState {
  DetailsPageStateError(this.error);

  final APIResponseError error;
}

class DetailsPageStateSuccess extends DetailsPageState {
  DetailsPageStateSuccess(this.imageUrl);

  final String imageUrl;
}
