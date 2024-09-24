import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../features/auth/presentation/ui/auth_screen.dart';
import '../../features/watch_faces/presentation/ui/watch_face_catalog_screen.dart';
import '../../features/wearables/domain/model/wearable.dart';
import '../../features/wearables/presentation/ui/wearable_catalog_screen.dart';

Route<dynamic> onGenerateRoute(RouteSettings settings) => MaterialPageRoute(
      builder: (context) => StreamBuilder(
        stream: FirebaseAuth.instance.userChanges(),
        builder: (context, snapshot) {
          final isUserAuthenticated = snapshot.data;

          if (isUserAuthenticated == null) {
            return const AuthScreen();
          }

          if (settings.name == '/watch_faces') {
            final wearable = settings.arguments as Wearable;

            return WatchFaceCatalogScreen(wearable: wearable);
          }

          return const WearableCatalogScreen();
        },
      ),
    );
