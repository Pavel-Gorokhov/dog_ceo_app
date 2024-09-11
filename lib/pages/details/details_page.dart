import 'package:dog_seo_app/navigator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/breed.dart';
import '../../widgets/app_bar.dart';
import 'bloc/details_page_bloc.dart';
import 'bloc/details_page_state.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({super.key, required this.breed});

  final Breed breed;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Column(
        children: [
          XAppBar(
            title: breed.name.toUpperCase(),
            icon: const Icon(
              Icons.arrow_back_ios,
              size: 22,
              color: Colors.white,
            ),
            action: () {
              XNavigator.pop(context);
            },
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  AspectRatio(
                    aspectRatio: 1,
                    child: BlocBuilder<DetailsPageBloc, DetailsPageState>(
                      builder: (context, state) {
                        if (state is DetailsPageStateLoading) {
                          return const Center(child: CupertinoActivityIndicator());
                        } else if (state is DetailsPageStateError) {
                          return Center(
                            child: Text(
                              state.error.message,
                              textAlign: TextAlign.center,
                            ),
                          );
                        } else if (state is DetailsPageStateSuccess) {
                          return Image.network(
                            state.imageUrl,
                            fit: BoxFit.contain,
                          );
                        } else {
                          return const SizedBox.shrink();
                        }
                      },
                    ),
                  ),
                  _subBreeds(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _subBreeds() {
    if (breed.subBreeds.isNotEmpty) {
      return Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'Sub breeds:',
              style: TextStyle(
                color: Colors.black,
                fontSize: 22,
                fontWeight: FontWeight.w500,
                letterSpacing: -0.3,
              ),
            ),
            const SizedBox(height: 16),
            ...breed.subBreeds.map((e) {
              return Text(
                e.name,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                  letterSpacing: -0.3,
                ),
              );
            }),
          ],
        ),
      );
    } else {
      return const SizedBox.shrink();
    }
  }
}
