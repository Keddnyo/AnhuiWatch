import 'package:firedart/firedart.dart';

import 'entity/wearable_entity.dart';
import 'mapper/wearable_mapper.dart';

class WearableFirestore {
  static Stream<List<WearableEntity>> get wearables => Firestore.instance
      .collection(
        '/wearables',
      )
      .stream
      .map(
        (documents) => documents
            .map((document) => WearableMapper.toWearableEntity(document))
            .toList(),
      );
}
