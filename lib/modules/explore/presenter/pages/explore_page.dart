import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:stage_up/core/theme/app_spacing.dart';
import 'package:stage_up/modules/explore/presenter/store/explore_store.dart';
import 'package:stage_up/modules/explore/presenter/widgets/category_chip.dart';
import 'package:stage_up/modules/explore/presenter/widgets/explore_empty_state.dart';
import 'package:stage_up/modules/explore/presenter/widgets/trending_event_card.dart';
import 'package:stage_up/modules/favorites/presenter/store/favorites_store.dart';
import 'package:stage_up/modules/home/presenter/widgets/event_card.dart';

class ExplorePage extends StatefulWidget {
  final ExploreStore exploreStore;
  final FavoriteStore favoritesStore;

  const ExplorePage(
      {super.key, required this.exploreStore, required this.favoritesStore});

  @override
  State<ExplorePage> createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
  final searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    clearFilters();
    widget.exploreStore.loadUserLocation();
  }

  void clearFilters() {
    searchController.clear();
    widget.exploreStore.clearFilters();
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Explorar',
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppSpacing.l),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              controller: searchController,
              onChanged: (value) {
                widget.exploreStore.setSearchQuery(value);
              },
              decoration: InputDecoration(
                hintText: 'Buscar shows, artistas ou locais',
                prefixIcon: Icon(Icons.search),
              ),
            ),
            SizedBox(height: AppSpacing.m),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Observer(builder: (context) {
                return Row(
                  children: [
                    CategoryChip(
                      label: 'Todos',
                      selected: widget.exploreStore.selectedCategory == 'Todos',
                      onSelected: (selected) {
                        widget.exploreStore.selectCategory('Todos');
                      },
                    ),
                    SizedBox(width: AppSpacing.s),
                    CategoryChip(
                      label: 'Festival',
                      selected:
                          widget.exploreStore.selectedCategory == 'Festival',
                      onSelected: (selected) {
                        widget.exploreStore.selectCategory('Festival');
                      },
                    ),
                    SizedBox(width: AppSpacing.s),
                    CategoryChip(
                      label: 'Rock',
                      selected: widget.exploreStore.selectedCategory == 'Rock',
                      onSelected: (selected) {
                        widget.exploreStore.selectCategory('Rock');
                      },
                    ),
                    SizedBox(width: AppSpacing.s),
                    CategoryChip(
                      label: 'Metal',
                      selected: widget.exploreStore.selectedCategory == 'Metal',
                      onSelected: (selected) {
                        widget.exploreStore.selectCategory('Metal');
                      },
                    ),
                    SizedBox(width: AppSpacing.s),
                    CategoryChip(
                      label: 'Pop',
                      selected: widget.exploreStore.selectedCategory == 'Pop',
                      onSelected: (selected) {
                        widget.exploreStore.selectCategory('Pop');
                      },
                    ),
                    SizedBox(width: AppSpacing.s),
                    CategoryChip(
                      label: 'Sertanejo',
                      selected:
                          widget.exploreStore.selectedCategory == 'Sertanejo',
                      onSelected: (selected) {
                        widget.exploreStore.selectCategory('Sertanejo');
                      },
                    ),
                    SizedBox(width: AppSpacing.s),
                    CategoryChip(
                      label: 'Pagode',
                      selected:
                          widget.exploreStore.selectedCategory == 'Pagode',
                      onSelected: (selected) {
                        widget.exploreStore.selectCategory('Pagode');
                      },
                    ),
                    SizedBox(width: AppSpacing.s),
                    CategoryChip(
                      label: 'Eletrônica',
                      selected:
                          widget.exploreStore.selectedCategory == 'Eletrônica',
                      onSelected: (selected) {
                        widget.exploreStore.selectCategory('Eletrônica');
                      },
                    ),
                  ],
                );
              }),
            ),
            Expanded(child: Observer(builder: (context) {
              if (widget.exploreStore.hasNoResults) {
                return ExploreEmptyState(onClearFilters: clearFilters);
              }
              return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: AppSpacing.xl),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Eventos em alta',
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                      ],
                    ),
                    SizedBox(height: AppSpacing.m),
                    Observer(builder: (context) {
                      final trendingEvents = widget.exploreStore.trendingEvents;
                      if (trendingEvents.isEmpty) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: AppSpacing.m),
                          child: Text(
                            'Nenhum evento em alta para os filtros selecionados.',
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                        );
                      }
                      return SizedBox(
                        height: 240,
                        child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          itemCount: trendingEvents.length,
                          separatorBuilder: (context, index) =>
                              SizedBox(width: AppSpacing.s),
                          itemBuilder: (context, index) {
                            final event = trendingEvents[index];
                            return SizedBox(
                                width: 180,
                                child: TrendingEventCard(event: event));
                          },
                        ),
                      );
                    }),
                    SizedBox(height: AppSpacing.xl),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Perto de você',
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                      ],
                    ),
                    SizedBox(height: AppSpacing.m),
                    Expanded(
                      child: Observer(builder: (context) {
                        if (widget.exploreStore.isLoadingLocation) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                        final error = widget.exploreStore.locationError;
                        if (error != null) {
                          return Text(error);
                        }

                        final nearbyEvents = widget.exploreStore.nearbyEvents;
                        if (nearbyEvents.isEmpty) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: AppSpacing.m),
                            child: Text(
                              'Que pena! Nenhum evento próximo para o filtro selecionado.',
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                          );
                        }
                        return ListView.separated(
                          itemCount: nearbyEvents.length,
                          separatorBuilder: (context, index) =>
                              const SizedBox(height: AppSpacing.s),
                          itemBuilder: (context, index) {
                            final event = nearbyEvents[index];

                            return Observer(builder: (context) {
                              return EventCard(
                                event: event,
                                eventFavoriteIcon:
                                    widget.favoritesStore.isFavorite(event.id),
                                onFavoritePressed: () =>
                                    widget.favoritesStore.toggleFavorite(event),
                              );
                            });
                          },
                        );
                      }),
                    ),
                  ]);
            }))
          ],
        ),
      ),
    );
  }
}
