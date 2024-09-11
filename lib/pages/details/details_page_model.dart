import 'dart:async';
import 'dart:convert';

import 'package:dog_seo_app/api/dog_ceo_api.dart';
import 'package:http/http.dart' as http;

import '../../api/api_response.dart';

String _pathApiBreedImagesRandom(String breedName) => 'api/breed/$breedName/images/random';

class DetailsPageModel {
  Future<APIResponse<String>> getBreadImageUrl(String breedName) async {
    APIResponse<String> result = APIResponse<String>();

    try {
      http.Response response = await DogCEOAPI.get(_pathApiBreedImagesRandom(breedName));
      if (response.statusCode == 200) {
        var body = jsonDecode(response.body);
        if (body is Map) {
          if (body['status'] == 'success') {
            var message = body['message'];
            if (message is String) {
              result.data = message;
            } else {
              result.error = APIResponseError(
                code: 'GBI-M-NM',
              );
            }
          } else {
            result.error = APIResponseError(
              code: 'GBI-S-${body['status'].toString()}',
            );
          }
        } else {
          result.error = APIResponseError(
            code: 'GBI-NM',
          );
        }
      } else {
        result.error = APIResponseError(
          code: response.statusCode.toString(),
        );
      }
    } catch (e) {
      if (e is TimeoutException) {
        result.error = APIResponseError(
          message: 'Please check your network connection and try again.',
        );
      } else if (e is http.ClientException && e.message.contains('Failed host lookup:')) {
        result.error = APIResponseError(
          message: 'Please check your network connection and try again.',
        );
      } else {
        result.error = APIResponseError(
          message: e.toString(),
        );
      }
    }

    return result;
  }
}
