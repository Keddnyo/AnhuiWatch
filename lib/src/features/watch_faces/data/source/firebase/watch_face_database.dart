import 'package:firedart/firedart.dart';

import 'entity/watch_face_entity.dart';
import 'mapper/watch_face_entity_mapper.dart';

class WatchFaceDatabase {
  WatchFaceDatabase(String deviceCode)
      : watchFacesCollection = Firestore.instance.collection(
          '/wearables/$deviceCode/watch_faces',
        );

  final CollectionReference watchFacesCollection;

  void cacheWatchFace(WatchFaceEntity watchFace) async {
    final watchFaceDocument = watchFacesCollection.document(watchFace.title);
    final isWatchFaceCached = await watchFaceDocument.exists;

    if (isWatchFaceCached) {
      watchFaceDocument.set(
        WatchFaceEntityMapper.toFirestoreModel(watchFace),
      );
    }
  }

  Stream<List<WatchFaceEntity>> getWatchFaces() =>
      watchFacesCollection.stream.map(
        (documents) => documents
            .map(
              (document) => WatchFaceEntityMapper.toWatchFaceEntity(document),
            )
            .toList(),
      );
}
