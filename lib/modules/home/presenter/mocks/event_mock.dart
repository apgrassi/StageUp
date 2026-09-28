import 'package:stage_up/modules/home/domain/entities/event.dart';

abstract class EventMock {
  static final List<Event> events = [
    Event(
      id: 1,
      name: 'Foo Fighters',
      description: 'Take Cover Tour',
      date: DateTime(2027, 2, 20),
      location: 'Estádio Morumbis',
      imagemUrl: 'https://images.unsplash.com/photo-1501386761578-eac5c94b800a',
    ),
    Event(
      id: 2,
      name: 'Maroon 5',
      description: 'Love Is Like World Tour',
      date: DateTime(2026, 9, 08),
      location: 'Allianz Parque',
      imagemUrl: 'https://images.unsplash.com/photo-1501386761578-eac5c94b800a',
    ),
    Event(
      id: 3,
      name: 'Fit For A King',
      description: 'Lonely God Latin America Tour',
      date: DateTime(2026, 10, 25),
      location: 'Carioca Club',
      imagemUrl: 'https://images.unsplash.com/photo-1501386761578-eac5c94b800a',
    ),
    Event(
      id: 4,
      name: 'CPM 22',
      description: '30 anos',
      date: DateTime(2026, 10, 03),
      location: 'Juventus Live Hall',
      imagemUrl: 'https://images.unsplash.com/photo-1501386761578-eac5c94b800a',
    ),
  ];
}
