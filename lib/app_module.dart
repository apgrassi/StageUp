import 'package:flutter_modular/flutter_modular.dart';
import 'package:stage_up/core/navigation/presenter/store/navigation_store.dart';
import 'package:stage_up/core/navigation/presenter/ui/router_page.dart';
import 'package:stage_up/modules/favorites/external/favorites_storage.dart';
import 'package:stage_up/modules/favorites/presenter/store/favorites_store.dart';
import 'package:stage_up/modules/home/domain/entities/event.dart';
import 'package:stage_up/modules/home/presenter/stores/home_store.dart';

class AppModule extends Module {
  final List<Event> initialEvents;
  final FavoritesStorage favoriteStorage;

  AppModule({required this.initialEvents, required this.favoriteStorage});

  @override
  void binds(Injector i) {
    i.addLazySingleton<NavigationStore>(NavigationStore.new);
    i.addLazySingleton<FavoriteStore>(
        () => FavoriteStore(favoriteStorage, initialEvents));
    i.addLazySingleton<HomeStore>(HomeStore.new);
  }

  @override
  void routes(RouteManager r) {
    r.child(
      '/',
      child: (context) => RouterPage(
        navigationStore: Modular.get<NavigationStore>(),
        favoriteStore: Modular.get<FavoriteStore>(),
        homeStore: Modular.get<HomeStore>(),
      ),
    );
  }
}
