class Event {
  final int id;
  final String name;
  final String category;
  final String description;
  final String location;
  final DateTime date;
  final String imagemUrl;
  final bool isTrending;
  final double latitude;
  final double longitude;
  final bool isPostponed;

  Event(
      {required this.id,
      required this.name,
      required this.category,
      required this.description,
      required this.location,
      required this.date,
      required this.imagemUrl,
      this.isTrending = false,
      required this.latitude,
      required this.longitude,
      this.isPostponed = false});
}
