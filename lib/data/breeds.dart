import 'package:dog_seo_app/data/breed.dart';
import 'package:dog_seo_app/data/sub_breed.dart';

class Breeds {
  Breeds(this.list);

  factory Breeds.fromJson(Map json) {
    List<Breed> breeds = [];

    json.forEach((k, v) {
      if (k is String) {
        List<SubBreed> subBreeds = [];
        if (v is List) {
          for (var subBreed in v) {
            if (subBreed is String) {
              subBreeds.add(SubBreed(name: subBreed));
            }
          }
        }
        breeds.add(Breed(
          name: k,
          subBreeds: subBreeds,
        ));
      }
    });

    return Breeds(breeds);
  }

  final List<Breed> list;
}
