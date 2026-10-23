// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'explore_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ExploreStore on ExploreStoreBase, Store {
  Computed<List<Event>>? _$trendingEventsComputed;

  @override
  List<Event> get trendingEvents => (_$trendingEventsComputed ??=
          Computed<List<Event>>(() => super.trendingEvents,
              name: 'ExploreStoreBase.trendingEvents'))
      .value;
  Computed<List<Event>>? _$nearbyEventsComputed;

  @override
  List<Event> get nearbyEvents => (_$nearbyEventsComputed ??=
          Computed<List<Event>>(() => super.nearbyEvents,
              name: 'ExploreStoreBase.nearbyEvents'))
      .value;
  Computed<bool>? _$hasNoResultsComputed;

  @override
  bool get hasNoResults =>
      (_$hasNoResultsComputed ??= Computed<bool>(() => super.hasNoResults,
              name: 'ExploreStoreBase.hasNoResults'))
          .value;

  late final _$selectedCategoryAtom =
      Atom(name: 'ExploreStoreBase.selectedCategory', context: context);

  @override
  String get selectedCategory {
    _$selectedCategoryAtom.reportRead();
    return super.selectedCategory;
  }

  @override
  set selectedCategory(String value) {
    _$selectedCategoryAtom.reportWrite(value, super.selectedCategory, () {
      super.selectedCategory = value;
    });
  }

  late final _$searchQueryAtom =
      Atom(name: 'ExploreStoreBase.searchQuery', context: context);

  @override
  String get searchQuery {
    _$searchQueryAtom.reportRead();
    return super.searchQuery;
  }

  @override
  set searchQuery(String value) {
    _$searchQueryAtom.reportWrite(value, super.searchQuery, () {
      super.searchQuery = value;
    });
  }

  late final _$userLocationAtom =
      Atom(name: 'ExploreStoreBase.userLocation', context: context);

  @override
  Position? get userLocation {
    _$userLocationAtom.reportRead();
    return super.userLocation;
  }

  @override
  set userLocation(Position? value) {
    _$userLocationAtom.reportWrite(value, super.userLocation, () {
      super.userLocation = value;
    });
  }

  late final _$isLoadingLocationAtom =
      Atom(name: 'ExploreStoreBase.isLoadingLocation', context: context);

  @override
  bool get isLoadingLocation {
    _$isLoadingLocationAtom.reportRead();
    return super.isLoadingLocation;
  }

  @override
  set isLoadingLocation(bool value) {
    _$isLoadingLocationAtom.reportWrite(value, super.isLoadingLocation, () {
      super.isLoadingLocation = value;
    });
  }

  late final _$locationErrorAtom =
      Atom(name: 'ExploreStoreBase.locationError', context: context);

  @override
  String? get locationError {
    _$locationErrorAtom.reportRead();
    return super.locationError;
  }

  @override
  set locationError(String? value) {
    _$locationErrorAtom.reportWrite(value, super.locationError, () {
      super.locationError = value;
    });
  }

  late final _$loadUserLocationAsyncAction =
      AsyncAction('ExploreStoreBase.loadUserLocation', context: context);

  @override
  Future<void> loadUserLocation() {
    return _$loadUserLocationAsyncAction.run(() => super.loadUserLocation());
  }

  late final _$ExploreStoreBaseActionController =
      ActionController(name: 'ExploreStoreBase', context: context);

  @override
  void setSearchQuery(String query) {
    final _$actionInfo = _$ExploreStoreBaseActionController.startAction(
        name: 'ExploreStoreBase.setSearchQuery');
    try {
      return super.setSearchQuery(query);
    } finally {
      _$ExploreStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void selectCategory(String category) {
    final _$actionInfo = _$ExploreStoreBaseActionController.startAction(
        name: 'ExploreStoreBase.selectCategory');
    try {
      return super.selectCategory(category);
    } finally {
      _$ExploreStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void clearFilters() {
    final _$actionInfo = _$ExploreStoreBaseActionController.startAction(
        name: 'ExploreStoreBase.clearFilters');
    try {
      return super.clearFilters();
    } finally {
      _$ExploreStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
selectedCategory: ${selectedCategory},
searchQuery: ${searchQuery},
userLocation: ${userLocation},
isLoadingLocation: ${isLoadingLocation},
locationError: ${locationError},
trendingEvents: ${trendingEvents},
nearbyEvents: ${nearbyEvents},
hasNoResults: ${hasNoResults}
    ''';
  }
}
