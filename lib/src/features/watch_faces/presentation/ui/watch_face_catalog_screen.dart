import 'package:flutter/material.dart';

import '../../../../core/utilities/open_url.dart';
import '../../../wearables/domain/model/wearable.dart';
import '../../data/repository/watch_face_repository.dart';
import '../../domain/use_cases/get_watch_faces_use_case.dart';

class WatchFaceCatalogScreen extends StatelessWidget {
  const WatchFaceCatalogScreen({super.key, required Wearable wearable})
      : _wearable = wearable;

  final Wearable _wearable;

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text(_wearable.deviceName),
        ),
        body: StreamBuilder(
          stream: GetWatchFacesUseCase(
            repository: WatchFaceRepositoryImpl(),
          )(
            _wearable.deviceCode,
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
                maxCrossAxisExtent: 384,
              ),
              itemBuilder: (context, index) {
                final watchFace = watchFaces[index];

                return Card(
                  elevation: 4.0,
                  child: InkWell(
                    onTap: () => openUrl(
                      watchFace.fileUrl,
                    ),
                    borderRadius: BorderRadius.circular(
                      12.0,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
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
                  ),
                );
              },
              itemCount: watchFaceCount,
            );
          },
        ),
      );
}
