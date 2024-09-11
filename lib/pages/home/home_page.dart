import 'package:dog_seo_app/api/api_response.dart';
import 'package:dog_seo_app/pages/home/bloc/home_page_bloc.dart';
import 'package:dog_seo_app/pages/home/bloc/home_page_event.dart';
import 'package:dog_seo_app/pages/home/bloc/home_page_state.dart';
import 'package:dog_seo_app/pages/home/widgets/breed_list_item.dart';
import 'package:dog_seo_app/pages/home/widgets/error_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/breed.dart';
import '../../data/breeds.dart';
import '../../widgets/app_bar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Column(
        children: [
          const XAppBar(title: 'Dog CEO App'),
          Expanded(
            child: BlocBuilder<HomePageBloc, HomePageState>(
              builder: (context, state) {
                switch (state) {
                  case HomePageStateLoading _:
                    return _loading();
                  case HomePageStateError s:
                    return _error(context, s.error);
                  case HomePageStateSuccess s:
                    return _breedsListWidget(context, s.breeds);
                  case _:
                    return _error(context, APIResponseError());
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _loading() {
    return const Center(
      child: CupertinoActivityIndicator(),
    );
  }

  Widget _error(BuildContext context, APIResponseError error) {
    return ErrorScreen(
      message: error.message,
      code: error.code,
      onRetry: () {
        context.read<HomePageBloc>().add(HomePageEventFetchData());
      },
    );
  }

  Widget _breedsListWidget(BuildContext context, Breeds breeds) {
    if (breeds.list.isEmpty) {
      return ErrorScreen(
        message: 'No breeds found',
        onRetry: () {
          context.read<HomePageBloc>().add(HomePageEventFetchData());
        },
      );
    } else {
      return ListView.builder(
        itemCount: breeds.list.length,
        padding: const EdgeInsets.symmetric(vertical: 16),
        itemBuilder: (context, i) {
          final Breed breed = breeds.list[i];
          return BreedListItem(breed: breed);
        },
      );
    }
  }
}
