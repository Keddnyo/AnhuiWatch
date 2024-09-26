import 'package:firedart/firedart.dart';

import '../entity/wearable_entity.dart';

class WearableMapper {
  static WearableEntity toWearableEntity(Document document) => WearableEntity(
        id: document.id,
        deviceName: document['deviceName'],
        deviceCode: document.id,
      );
}
