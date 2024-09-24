import '../../domain/model/wearable.dart';
import '../../domain/repository/wearable_repository.dart';
import '../firebase/wearable_firestore.dart';

class WearableRepositoryImpl implements WearableRepository {
  @override
  Stream<List<Wearable>> get wearables => WearableFirestore.wearables;
}
