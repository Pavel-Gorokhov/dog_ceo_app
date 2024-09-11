abstract class DetailsPageEvent {}

class DetailsPageEventFetchImageUrl extends DetailsPageEvent {
  DetailsPageEventFetchImageUrl(this.breedName);

  final String breedName;
}
