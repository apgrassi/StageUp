import 'package:shared_preferences/shared_preferences.dart';

class FavoritesStorage {
  final SharedPreferencesAsync _preferences = SharedPreferencesAsync();

  static const String _key = 'favorite_event_ids';

  Future<List<int>> loadIds() async {
    final savedIds = await _preferences.getStringList(_key) ?? [];

    return savedIds.map(int.tryParse).whereType<int>().toList();
  }

  Future<void> saveIds(List<int> ids) async {
    final savedIds = ids.map((id) => id.toString()).toList();

    await _preferences.setStringList(_key, savedIds);
  }
}
