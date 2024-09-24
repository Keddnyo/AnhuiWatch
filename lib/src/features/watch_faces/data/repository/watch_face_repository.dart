import '../../domain/model/watch_face.dart';
import '../../domain/repository/watch_face_repository.dart';
import '../source/api/mapper/watch_face_dto_mapper.dart';
import '../source/api/watch_face_api.dart';
import '../source/firebase/watch_face_database.dart';

class WatchFaceRepositoryImpl implements WatchFaceRepository {
  @override
  Stream<List<WatchFace>> getWatchFaces(String deviceCode) {
    final db = WatchFaceDatabase(deviceCode);

    WatchFaceApi.getWatchFaces(deviceCode).then((watchFaces) {
      for (final watchFaceDto in watchFaces) {
        final watchFace = WatchFaceDtoMapper.toWatchFaceEntity(watchFaceDto);

        db.cacheWatchFace(watchFace);
      }
    });

    return db.getWatchFaces();
  }
}
