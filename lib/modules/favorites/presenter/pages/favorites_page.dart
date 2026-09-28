import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:stage_up/core/theme/app_spacing.dart';
import 'package:stage_up/modules/favorites/presenter/store/favorites_store.dart';
import 'package:stage_up/modules/home/presenter/widgets/event_card.dart';

class FavoritesPage extends StatelessWidget {
  final FavoriteStore store;
  const FavoritesPage({super.key, required this.store});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favoritos'),
      ),
      body: Observer(
        builder: (context) {
          if (store.favoriteEvents.isEmpty) {
            return Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.favorite_border,
                    size: 64,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  const SizedBox(height: AppSpacing.m),
                  Text(
                    'Nenhum evento favoritado',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const SizedBox(height: AppSpacing.s),
                  Text(
                    'Salve os shows que você não quer perder.',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ],
              ),
            );
          }

          return ListView.builder(
            padding: const EdgeInsets.symmetric(
              horizontal: AppSpacing.l,
              vertical: AppSpacing.m,
            ),
            itemCount: store.favoriteEvents.length,
            itemBuilder: (context, index) {
              final event = store.favoriteEvents[index];

              return Padding(
                padding: const EdgeInsets.only(
                  bottom: AppSpacing.s,
                ),
                child: EventCard(
                  event: event,
                  eventFavoriteIcon: store.isFavorite(event.id),
                  onFavoritePressed: () {
                    store.toggleFavorite(event);
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }
}
