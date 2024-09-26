import 'package:flutter/material.dart';

import '../../../../core/utilities/open_url.dart';
import '../../../wearables/domain/model/wearable.dart';
import '../../data/repository/watch_face_repository.dart';
import '../../domain/use_cases/get_watch_faces_use_case.dart';
import 'widgets/watch_face_card.dart';

class WatchFaceCatalogScreen extends StatelessWidget {
  const WatchFaceCatalogScreen({super.key, required this.wearable});

  final Wearable wearable;

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text(wearable.deviceName ?? wearable.deviceCode),
        ),
        body: StreamBuilder(
          stream: GetWatchFacesUseCase(
            repository: WatchFaceRepositoryImpl(),
          )(
            wearable.deviceCode,
          ),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            final watchFaces = snapshot.data!;
            final watchFaceCount = watchFaces.length;

            if (watchFaces.isEmpty) {
              return const Padding(
                padding: EdgeInsets.all(12.0),
                child: Center(
                  child: Text(
                    'No watch faces',
                    textAlign: TextAlign.center,
                  ),
                ),
              );
            }

            return GridView.builder(
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 256,
              ),
              itemBuilder: (context, index) {
                final watchFace = watchFaces[index];

                return WatchFaceCard(
                  watchFace: watchFace,
                  onTap: () => openUrl(watchFace.fileUrl),
                );
              },
              itemCount: watchFaceCount,
            );
          },
        ),
      );
}
