import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../api/api_response.dart';
import '../details_page_model.dart';
import 'details_page_event.dart';
import 'details_page_state.dart';

class DetailsPageBloc extends Bloc<DetailsPageEvent, DetailsPageState> {
  DetailsPageBloc() : super(DetailsPageStateLoading()) {
    on<DetailsPageEventFetchImageUrl>((event, emit) async {
      await getBreeds(event, emit);
    });
  }

  final DetailsPageModel _model = DetailsPageModel();

  Future<void> getBreeds(DetailsPageEventFetchImageUrl event, Emitter<DetailsPageState> emit) async {
    emit(DetailsPageStateLoading());

    APIResponse<String> response = await _model.getBreadImageUrl(event.breedName);
    if (response.error != null) {
      emit(DetailsPageStateError(response.error!));
    } else if (response.data != null) {
      emit(DetailsPageStateSuccess(response.data!));
    } else {
      emit(DetailsPageStateError(APIResponseError()));
    }
  }
}
