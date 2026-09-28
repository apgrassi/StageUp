import 'package:mobx/mobx.dart';
import 'package:stage_up/modules/home/domain/entities/event.dart';
import 'package:stage_up/modules/home/presenter/mocks/event_mock.dart';

part 'home_store.g.dart';

class HomeStore = HomeStoreBase with _$HomeStore;

abstract class HomeStoreBase with Store {
  final ObservableList<Event> events = ObservableList<Event>();

  @action
  void loadEvents() {
    isLoading = true;
    events.clear();
    events.addAll(EventMock.events);
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
