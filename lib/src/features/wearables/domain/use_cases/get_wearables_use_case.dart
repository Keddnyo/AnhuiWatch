import '../model/wearable.dart';
import '../repository/wearable_repository.dart';

class GetWearablesUseCase {
  const GetWearablesUseCase({required this.repository});

  final WearableRepository repository;

  Stream<List<Wearable>> call() => repository.wearables;
}
