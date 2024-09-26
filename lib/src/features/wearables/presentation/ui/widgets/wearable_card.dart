import 'package:flutter/material.dart';

import '../../../../../shared/presentation/ui/widgets/clickable_card.dart';
import '../../../domain/model/wearable.dart';

class WearableCard extends StatelessWidget {
  const WearableCard({super.key, required this.wearable, required this.onTap});

  final Wearable wearable;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) => ClickableCard(
        onTap: onTap,
        child: ListTile(
          leading: const CircleAvatar(
            child: Icon(Icons.watch),
          ),
          title: Text(
            wearable.deviceName ?? wearable.deviceCode,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          subtitle: Text(wearable.deviceCode),
        ),
      );
}
