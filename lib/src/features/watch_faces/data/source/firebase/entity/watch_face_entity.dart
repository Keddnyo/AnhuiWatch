import '../../../../domain/model/watch_face.dart';

class WatchFaceEntity extends WatchFace {
  const WatchFaceEntity({
    this.id,
    required super.title,
    required super.imageUrl,
    required super.fileUrl,
  });

  final String? id;
}
