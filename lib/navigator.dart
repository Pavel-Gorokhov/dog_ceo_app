import 'package:dog_seo_app/pages/details/bloc/details_page_bloc.dart';
import 'package:dog_seo_app/pages/details/bloc/details_page_event.dart';
import 'package:dog_seo_app/pages/details/details_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'data/breed.dart';

class XNavigator {
  static goToBreedDetails(BuildContext context, {required Breed breed}) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => BlocProvider(
          create: (_) => DetailsPageBloc()..add(DetailsPageEventFetchImageUrl(breed.name)),
          child: DetailsPage(
            breed: breed,
          ),
        ),
      ),
    );
  }

  static pop(BuildContext context, [dynamic result]) {
    if (Navigator.canPop(context)) {
      Navigator.pop(context, result);
    }
  }
}
