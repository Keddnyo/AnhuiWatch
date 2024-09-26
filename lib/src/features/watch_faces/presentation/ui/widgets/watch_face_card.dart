import 'package:flutter/material.dart';

import '../../../../../shared/presentation/ui/widgets/clickable_card.dart';
import '../../../domain/model/watch_face.dart';

class WatchFaceCard extends StatelessWidget {
  const WatchFaceCard({
    super.key,
    required this.watchFace,
    required this.onTap,
  });

  final WatchFace watchFace;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) => ClickableCard(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.network(
            watchFace.imageUrl,
            loadingBuilder: (context, child, loadingProgress) {
              if (loadingProgress != null) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }

              return child;
            },
          ),
        ),
      );
}
