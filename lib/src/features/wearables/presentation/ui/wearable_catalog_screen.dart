import 'package:flutter/material.dart';

import '../../../../core/constants.dart';
import '../../data/repository/wearable_repository_impl.dart';
import '../../domain/use_cases/get_wearables_use_case.dart';
import 'widgets/wearable_card.dart';

class WearableCatalogScreen extends StatelessWidget {
  const WearableCatalogScreen({super.key});

  void showAboutDialog(BuildContext context) => showDialog(
        context: context,
        builder: (context) => AboutDialog(
          applicationVersion: '1.0.0',
          applicationIcon: Image.asset(
            'assets/icon.png',
            width: 72.0,
            height: 72.0,
          ),
          applicationLegalese: applicationLegalese,
        ),
      );

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text(appName),
          actions: [
            IconButton(
              onPressed: () => showAboutDialog(context),
              icon: const Icon(Icons.info_outline),
            ),
          ],
        ),
        body: StreamBuilder(
          stream: GetWearablesUseCase(
            repository: WearableRepositoryImpl(),
          )(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            final wearables = snapshot.data!;
            final wearableCount = wearables.length;

            return ListView.builder(
              itemBuilder: (context, index) {
                final wearable = wearables[index];

                return Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: WearableCard(
                    wearable: wearable,
                    onTap: () => Navigator.pushNamed(
                      context,
                      '/watch_faces',
                      arguments: wearable,
                    ),
                  ),
                );
              },
              itemCount: wearableCount,
            );
          },
        ),
      );
}
