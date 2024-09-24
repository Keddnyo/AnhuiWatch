import 'package:flutter/material.dart';

import '../../../auth/domain/interactor/auth_interactor.dart';
import '../../data/repository/wearable_repository_impl.dart';
import '../../domain/use_cases/get_wearables_use_case.dart';
import 'widgets/wearable_card.dart';

class WearableCatalogScreen extends StatelessWidget {
  const WearableCatalogScreen({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('AnhuiWatch'),
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

            if (snapshot.data!.isEmpty) {
              return const Center(
                child: Padding(
                  padding: EdgeInsets.all(12.0),
                  child: Text(
                    'No wearables',
                    textAlign: TextAlign.center,
                  ),
                ),
              );
            }

            final wearables = snapshot.data!;
            final wearableCount = wearables.length;

            return ListView.separated(
              itemBuilder: (context, index) {
                final wearable = wearables[index];

                return WearableCard(
                  wearable: wearable,
                  onTap: () => Navigator.pushNamed(
                    context,
                    '/watch_faces',
                    arguments: wearable,
                  ),
                );
              },
              separatorBuilder: (context, index) => const Divider(),
              itemCount: wearableCount,
            );
          },
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              const DrawerHeader(
                child: Center(
                  child: Text(
                    'AnhuiWatch',
                    style: TextStyle(
                      fontSize: 36.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              ListTile(
                title: Text(AuthInteractor.instance.username!),
                subtitle: Text(AuthInteractor.instance.userEmail!),
                trailing: IconButton(
                  onPressed: AuthInteractor.instance.signOut,
                  icon: const Icon(Icons.logout),
                ),
              ),
              const Divider(),
              const AboutListTile(
                icon: Icon(Icons.info_outline),
              ),
            ],
          ),
        ),
      );
}
