import 'package:geolocator/geolocator.dart';
import 'package:mobx/mobx.dart';
import 'package:stage_up/core/services/location_service.dart';
import 'package:stage_up/modules/home/domain/entities/event.dart';

part 'explore_store.g.dart';

class ExploreStore = ExploreStoreBase with _$ExploreStore;

abstract class ExploreStoreBase with Store {
  final List<Event> events;
  final LocationService locationService;

  ExploreStoreBase(this.events, this.locationService);

  @observable
  String selectedCategory = 'Todos';

  @observable
  String searchQuery = '';

  @observable
  Position? userLocation;

  @observable
  bool isLoadingLocation = false;

  @observable
  String? locationError;

  @action
  void setSearchQuery(String query) {
    searchQuery = query;
  }

  @action
  void selectCategory(String category) {
    selectedCategory = category;
  }

  @action
  Future<void> loadUserLocation() async {
    isLoadingLocation = true;
    locationError = null;
    try {
      userLocation = await locationService.getCurrentLocation();
    } catch (e) {
      locationError = e.toString();
    } finally {
      isLoadingLocation = false;
    }
  }

  @action
  void clearFilters() {
    searchQuery = '';
    selectedCategory = 'Todos';
  }

  @computed
  List<Event> get trendingEvents {
    final query = searchQuery.trim().toLowerCase();
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final trending = events.where((event) {
      final shouldDisplay = event.isPostponed || !event.date.isBefore(today);
      final matchesCategory = selectedCategory == 'Todos' ||
          event.category.toLowerCase() == selectedCategory.toLowerCase();
      final matchesSearch = event.name.toLowerCase().contains(query) ||
          event.location.toLowerCase().contains(query);

      return event.isTrending &&
          matchesCategory &&
          matchesSearch &&
          shouldDisplay;
    }).toList();
    trending.sort((a, b) => a.date.compareTo(b.date));
    return trending;
  }

  @computed
  List<Event> get nearbyEvents {
    final position = userLocation;
    if (position == null) {
      return [];
    }
    final query = searchQuery.trim().toLowerCase();
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final nearby = events.where((event) {
      final shouldDisplay = event.isPostponed || !event.date.isBefore(today);
      final matchesCategory = selectedCategory == 'Todos' ||
          event.category.toLowerCase() == selectedCategory.toLowerCase();
      final matchesSearch = event.name.toLowerCase().contains(query) ||
          event.location.toLowerCase().contains(query);

      return matchesCategory && matchesSearch && shouldDisplay;
    }).toList();

    nearby.sort((a, b) {
      final dayA = DateTime(a.date.year, a.date.month, a.date.day);
      final dayB = DateTime(b.date.year, b.date.month, b.date.day);

      final dateComparison = dayA.compareTo(dayB);

      if (dateComparison != 0) {
        return dateComparison;
      }
      final distanceA = Geolocator.distanceBetween(
        position.latitude,
        position.longitude,
        a.latitude,
        a.longitude,
      );

      final distanceB = Geolocator.distanceBetween(
        position.latitude,
        position.longitude,
        b.latitude,
        b.longitude,
      );

      return distanceA.compareTo(distanceB);
    });

    return nearby;
  }

  @computed
  bool get hasNoResults {
    return !isLoadingLocation &&
        locationError == null &&
        userLocation != null &&
        trendingEvents.isEmpty &&
        nearbyEvents.isEmpty;
  }
}
