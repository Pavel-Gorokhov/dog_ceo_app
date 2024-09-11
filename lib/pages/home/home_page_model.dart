import 'dart:async';
import 'dart:convert';

import 'package:dog_seo_app/api/dog_ceo_api.dart';
import 'package:http/http.dart' as http;

import '../../api/api_response.dart';
import '../../data/breeds.dart';

const _pathApiBreedsListAll = 'api/breeds/list/all';

class HomePageModel {
  Future<APIResponse<Breeds>> getAllBreads() async {
    APIResponse<Breeds> result = APIResponse<Breeds>();

    try {
      http.Response response = await DogCEOAPI.get(_pathApiBreedsListAll);
      if (response.statusCode == 200) {
        var body = jsonDecode(response.body);
        if (body is Map) {
          if (body['status'] == 'success') {
            var message = body['message'];
            if (message is Map<String, dynamic>) {
              result.data = Breeds.fromJson(message);
            } else {
              /// The code means Get All Breads - Message - Not a Map
              result.error = APIResponseError(
                code: 'GAB-M-NM',
              );
            }
          } else {
            /// The code means Get All Breads - Status - [the status which is not 'success']
            result.error = APIResponseError(
              code: 'GAB-S-${body['status'].toString()}',
            );
          }
        } else {
          /// The code means Get All Breads - Not a Map
          result.error = APIResponseError(
            code: 'GAB-NM',
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
