import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:stage_up/app.dart';
import 'package:stage_up/app_module.dart';
import 'package:stage_up/modules/favorites/external/favorites_storage.dart';
import 'package:stage_up/modules/home/presenter/mocks/event_mock.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final storege = FavoritesStorage();
  final savedIds = (await storege.loadIds()).toSet();

  final initialFavorites =
      EventMock.events.where((event) => savedIds.contains(event.id)).toList();

  runApp(
    ModularApp(
      module:
          AppModule(favoriteStorage: storege, initialEvents: initialFavorites),
      child: const StageUpApp(),
    ),
  );
}
