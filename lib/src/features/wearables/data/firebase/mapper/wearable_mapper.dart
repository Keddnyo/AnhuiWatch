import 'package:cloud_firestore/cloud_firestore.dart';

import '../entity/wearable_entity.dart';

class WearableMapper {
  static WearableEntity toWearableEntity(
    DocumentSnapshot<Map<String, dynamic>> documentSnapshot,
  ) =>
      WearableEntity(
        id: documentSnapshot.id,
        deviceName: documentSnapshot['deviceName'],
        deviceCode: documentSnapshot.id,
      );
}
