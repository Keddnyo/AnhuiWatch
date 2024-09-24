import 'package:cloud_firestore/cloud_firestore.dart';

import '../entity/watch_face_entity.dart';

class WatchFaceEntityMapper {
  static WatchFaceEntity toWatchFaceEntity(
    DocumentSnapshot<Map<String, dynamic>> document,
  ) =>
      WatchFaceEntity(
        id: document.id,
        title: document['title'],
        imageUrl: document['imageUrl'],
        fileUrl: document['fileUrl'],
      );

  static Map<String, dynamic> toFirestoreModel(
    WatchFaceEntity watchface,
  ) =>
      {
        'title': watchface.title,
        'imageUrl': watchface.imageUrl,
        'fileUrl': watchface.fileUrl,
      };
}
