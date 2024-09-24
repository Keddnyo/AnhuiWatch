import '../model/watch_face.dart';
import '../repository/watch_face_repository.dart';

class GetWatchFacesUseCase {
  const GetWatchFacesUseCase({required this.repository});

  final WatchFaceRepository repository;

  Stream<List<WatchFace>> call(String deviceCode) =>
      repository.getWatchFaces(deviceCode);
}
