import '../model/watch_face.dart';

abstract class WatchFaceRepository {
  Stream<List<WatchFace>> getWatchFaces(String deviceCode);
}
