import '../../../domain/model/wearable.dart';

class WearableEntity extends Wearable {
  const WearableEntity({
    required this.id,
    required super.deviceName,
    required super.deviceCode,
  });

  final String id;
}
