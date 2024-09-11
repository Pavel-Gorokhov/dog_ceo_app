import 'package:dog_seo_app/pages/home/bloc/home_page_event.dart';
import 'package:dog_seo_app/pages/home/bloc/home_page_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../api/api_response.dart';
import '../../../data/breeds.dart';
import '../home_page_model.dart';

class HomePageBloc extends Bloc<HomePageEvent, HomePageState> {
  HomePageBloc() : super(HomePageStateLoading()) {
    on<HomePageEventFetchData>((event, emit) async {
      await getBreeds(emit);
    });
  }

  final HomePageModel _model = HomePageModel();

  Future<void> getBreeds(Emitter<HomePageState> emit) async {
    emit(HomePageStateLoading());

    APIResponse<Breeds> response = await _model.getAllBreads();
    if (response.error != null) {
      emit(HomePageStateError(response.error!));
    } else if (response.data != null) {
      emit(HomePageStateSuccess(response.data!));
    } else {
      emit(HomePageStateError(APIResponseError()));
    }
  }
}
