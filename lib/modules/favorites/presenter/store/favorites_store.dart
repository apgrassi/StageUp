import 'package:mobx/mobx.dart';
import 'package:stage_up/modules/favorites/external/favorites_storage.dart';
import 'package:stage_up/modules/home/domain/entities/event.dart';

part 'favorites_store.g.dart';

class FavoriteStore = FavoriteStoreBase with _$FavoriteStore;

abstract class FavoriteStoreBase with Store {
  final FavoritesStorage storage;
  final ObservableList<Event> favoriteEvents;
  Future<void> pendingSave = Future<void>.value();

  FavoriteStoreBase(this.storage, List<Event> initialEvents)
      : favoriteEvents = ObservableList<Event>.of(initialEvents);

  bool isFavorite(int id) {
    return favoriteEvents.any((event) => event.id == id);
  }

  @action
  Future<void> toggleFavorite(Event event) async {
    if (isFavorite(event.id)) {
      favoriteEvents.removeWhere(
        (favorite) => favorite.id == event.id,
      );
    } else {
      favoriteEvents.add(event);
    }
    final ids = favoriteEvents.map((event) => event.id).toList();
    final save = pendingSave.then((_) => storage.saveIds(ids));

    pendingSave = save.then<void>(
      (_) {},
      onError: (Object error, StackTrace stackTrace) {},
    );
    await save;
  }
}
