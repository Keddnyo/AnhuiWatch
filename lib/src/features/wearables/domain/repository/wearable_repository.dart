import '../model/wearable.dart';

abstract class WearableRepository {
  Stream<List<Wearable>> get wearables;
}
