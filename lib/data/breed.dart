import 'package:dog_seo_app/data/sub_breed.dart';

class Breed {
  Breed({
    required this.name,
    this.subBreeds = const [],
  });

  final String name;
  final List<SubBreed> subBreeds;
}
