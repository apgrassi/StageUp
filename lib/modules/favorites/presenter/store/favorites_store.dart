import 'package:mobx/mobx.dart';
import 'package:stage_up/modules/home/domain/entities/event.dart';

part 'favorites_store.g.dart';

class FavoriteStore = FavoriteStoreBase with _$FavoriteStore;

abstract class FavoriteStoreBase with Store {
  final ObservableList<Event> favoriteEvents = ObservableList<Event>();

  bool isFavorite(int id) {
    return favoriteEvents.any((event) => event.id == id);
  }

  @action
  void toggleFavorite(Event event) {
    if (isFavorite(event.id)) {
      favoriteEvents.removeWhere(
        (favorite) => favorite.id == event.id,
      );
    } else {
      favoriteEvents.add(event);
    }
  }
}
