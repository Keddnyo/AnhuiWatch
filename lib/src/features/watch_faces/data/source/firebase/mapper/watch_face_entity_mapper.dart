import 'package:firedart/firedart.dart';

import '../entity/watch_face_entity.dart';

class WatchFaceEntityMapper {
  static WatchFaceEntity toWatchFaceEntity(Document document) =>
      WatchFaceEntity(
        id: document.id,
        title: document['title'],
        imageUrl: document['imageUrl'],
        fileUrl: document['fileUrl'],
      );

  static Map<String, dynamic> toFirestoreModel(WatchFaceEntity watchface) => {
        'title': watchface.title,
        'imageUrl': watchface.imageUrl,
        'fileUrl': watchface.fileUrl,
      };
}
