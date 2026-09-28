import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:stage_up/core/theme/app_spacing.dart';
import 'package:stage_up/core/theme/app_colors.dart';
import 'package:stage_up/modules/favorites/presenter/store/favorites_store.dart';
import 'package:stage_up/modules/home/presenter/stores/home_store.dart';
import 'package:stage_up/modules/home/presenter/widgets/event_card.dart';

class HomePage extends StatefulWidget {
  final HomeStore homeStore;
  final FavoriteStore favoritesStore;
  const HomePage(
      {super.key, required this.favoritesStore, required this.homeStore});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomeStore get store => widget.homeStore;

  @override
  void initState() {
    super.initState();
    store.loadEvents();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: RichText(
              text: TextSpan(
            text: 'Stage',
            style: Theme.of(context).textTheme.titleLarge,
            children: [
              TextSpan(
                text: 'Up',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      color: Theme.of(context).colorScheme.primary,
                    ),
              ),
            ],
          )),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: AppSpacing.l),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Olá, Ana!', style: Theme.of(context).textTheme.titleMedium),
            SizedBox(height: AppSpacing.s),
            Text('Encontre os melhores shows\nperto de você',
                textAlign: TextAlign.left,
                style: Theme.of(context).textTheme.bodySmall),
            SizedBox(height: AppSpacing.l),
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: 'Buscar shows, artistas ou locais',
                      prefixIcon: Icon(Icons.search),
                    ),
                  ),
                ),
                SizedBox(width: AppSpacing.m),
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.filter_list,
                    color: AppColors.textPrimary,
                  ),
                  style: IconButton.styleFrom(
                    backgroundColor: AppColors.surface,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(AppSpacing.m),
                    ),
                    minimumSize: Size(52, 52),
                  ),
                ),
              ],
            ),
            SizedBox(height: AppSpacing.xl),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Próximos shows',
                    style: Theme.of(context).textTheme.titleMedium),
                TextButton(
                  onPressed: () {},
                  child: Text('Ver todos',
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: Theme.of(context).colorScheme.primary,
                          )),
                ),
              ],
            ),
            SizedBox(height: AppSpacing.l),
            Expanded(
              child: Observer(builder: (context) {
                if (store.isLoading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if (store.errorMessage != null) {
                  return Text(store.errorMessage!);
                }
                if (store.events.isEmpty) {
                  return const Center(
                    child: Text('Nenhum evento encontrado'),
                  );
                }

                return ListView.builder(
                  itemCount: store.events.length,
                  itemBuilder: (context, index) {
                    final event = store.events[index];

                    return Padding(
                      padding: const EdgeInsets.only(bottom: AppSpacing.s),
                      child: Observer(builder: (context) {
                        return EventCard(
                            event: event,
                            eventFavoriteIcon:
                                widget.favoritesStore.isFavorite(event.id),
                            onFavoritePressed: () =>
                                widget.favoritesStore.toggleFavorite(event));
                      }),
                    );
                  },
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
