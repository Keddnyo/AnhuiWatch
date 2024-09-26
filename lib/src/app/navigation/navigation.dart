import 'package:flutter/material.dart';

import '../../features/watch_faces/presentation/ui/watch_face_catalog_screen.dart';
import '../../features/wearables/domain/model/wearable.dart';
import '../../features/wearables/presentation/ui/wearable_catalog_screen.dart';

Route<dynamic> onGenerateRoute(RouteSettings settings) => MaterialPageRoute(
      builder: (context) => settings.name == '/watch_faces'
          ? WatchFaceCatalogScreen(
              wearable: settings.arguments as Wearable,
            )
          : const WearableCatalogScreen(),
    );
