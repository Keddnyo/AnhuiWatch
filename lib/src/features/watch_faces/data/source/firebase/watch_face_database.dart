import 'package:cloud_firestore/cloud_firestore.dart';

import 'entity/watch_face_entity.dart';
import 'mapper/watch_face_entity_mapper.dart';

class WatchFaceDatabase {
  WatchFaceDatabase(String deviceCode)
      : _watchFacesCollection = FirebaseFirestore.instance
            .collection('/wearables/$deviceCode/watch_faces')
            .withConverter<WatchFaceEntity>(
              fromFirestore: (snapshot, options) =>
                  WatchFaceEntityMapper.toWatchFaceEntity(snapshot),
              toFirestore: (snapshot, options) =>
                  WatchFaceEntityMapper.toFirestoreModel(snapshot),
            );

  final CollectionReference<WatchFaceEntity> _watchFacesCollection;

  void cacheWatchFace(WatchFaceEntity watchFace) async {
    final watchFaceDocument = _watchFacesCollection.doc(watchFace.title);
    final watchFaceDocumentSnapshot = await watchFaceDocument.get();
    final watchFaceData = watchFaceDocumentSnapshot.data();

    if (watchFaceData == null) {
      watchFaceDocument.set(watchFace);
    }
  }

  Stream<List<WatchFaceEntity>> getWatchFaces() => _watchFacesCollection
      .orderBy('title')
      .snapshots()
      .map((query) => query.docs.map((doc) => doc.data()).toList());
}
