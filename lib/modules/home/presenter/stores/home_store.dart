import 'package:mobx/mobx.dart';
import 'package:stage_up/modules/home/domain/entities/event.dart';
import 'package:stage_up/modules/home/presenter/mocks/event_mock.dart';

part 'home_store.g.dart';

class HomeStore = HomeStoreBase with _$HomeStore;

abstract class HomeStoreBase with Store {
  final ObservableList<Event> events = ObservableList<Event>();

  @observable
  String searchText = '';

  @action
  void setSearchText(String? value) {
    searchText = value ?? '';
  }

  @computed
  List<Event> get filteredEvents {
    final query = searchText.trim().toLowerCase();
    if (query.isEmpty) {
      return events.toList();
    }
    return events.where((event) {
      final name = event.name.toLowerCase();
      final location = event.location.toLowerCase();
      return name.contains(query) || location.contains(query);
    }).toList();
  }

  @action
  void loadEvents() {
    isLoading = true;

    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);

    events.clear();

    events
        .addAll(EventMock.events.where((event) => !event.date.isBefore(today)));

    events.sort(
      (a, b) {
        return a.date.compareTo(b.date);
      },
    );

    isLoading = false;
  }

  @observable
  bool isLoading = false;

  @observable
  String? errorMessage;
}
