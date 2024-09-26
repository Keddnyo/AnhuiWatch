import 'package:cloud_firestore/cloud_firestore.dart';

import 'entity/wearable_entity.dart';
import 'mapper/wearable_mapper.dart';

class WearableFirestore {
  static Stream<List<WearableEntity>> get wearables => FirebaseFirestore
      .instance
      .collection('/wearables')
      .snapshots()
      .map((query) => query.docs.map(WearableMapper.toWearableEntity).toList());
}
