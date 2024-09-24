import 'package:flutter/material.dart';

import '../../../domain/model/wearable.dart';

class WearableCard extends StatelessWidget {
  const WearableCard({
    super.key,
    required Wearable wearable,
    required VoidCallback onTap,
  })  : _wearable = wearable,
        _onTap = onTap;

  final Wearable _wearable;
  final VoidCallback _onTap;

  @override
  Widget build(BuildContext context) => ListTile(
        leading: const Icon(Icons.watch),
        title: Text(_wearable.deviceName),
        subtitle: Text(_wearable.deviceCode),
        onTap: _onTap,
      );
}
