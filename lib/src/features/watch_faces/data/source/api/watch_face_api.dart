import 'dart:convert';

import 'package:http/http.dart';

import 'dto/watch_face_dto.dart';
import 'mapper/watch_face_dto_mapper.dart';

class WatchFaceApi {
  static Future<List<WatchFaceDto>> getWatchFaces(String deviceCode) async {
    const authority = 'watch-appstore.iot.mi.com';
    const path = '/api/watchface/prize/tabs';
    final parameters = {'model': deviceCode};

    final url = Uri.https(authority, path, parameters);

    final response = await get(url);

    if (response.statusCode != 200) {
      return [];
    }

    final json = jsonDecode(response.body);

    final List<dynamic> data = json['data'];

    if (data.isEmpty) {
      return [];
    }

    final List<WatchFaceDto> watchFaces = [];

    for (final Map<String, dynamic> tab in data) {
      final List<dynamic> list = tab['list'];

      for (final Map<String, dynamic> watchFace in list) {
        final watchFaceDto = WatchFaceDtoMapper.toWatchFaceDto(watchFace);

        watchFaces.add(watchFaceDto);
      }
    }

    return watchFaces;
  }
}
