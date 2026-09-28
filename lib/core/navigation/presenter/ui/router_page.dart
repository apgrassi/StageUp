import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:stage_up/core/navigation/presenter/store/navigation_store.dart';
import 'package:stage_up/modules/explore/presenter/explore_page.dart';
import 'package:stage_up/modules/favorites/presenter/pages/favorites_page.dart';
import 'package:stage_up/modules/favorites/presenter/store/favorites_store.dart';
import 'package:stage_up/modules/home/presenter/pages/home_page.dart';
import 'package:stage_up/modules/home/presenter/stores/home_store.dart';
import 'package:stage_up/modules/profile/presenter/profile_page.dart';
import 'package:stage_up/modules/tickets/presenter/tickets_page.dart';

class RouterPage extends StatelessWidget {
  final NavigationStore navigationStore;
  final FavoriteStore favoriteStore;
  final HomeStore homeStore;
  RouterPage(
      {super.key,
      required this.navigationStore,
      required this.favoriteStore,
      required this.homeStore});

  late final List<Widget> pages = [
    HomePage(favoritesStore: favoriteStore, homeStore: homeStore),
    const ExplorePage(),
    FavoritesPage(store: favoriteStore), // Pass the favoriteStore instance here
    const TicketsPage(),
    const ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
      return Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: navigationStore.currentIndex,
          onTap: (index) {
            navigationStore.setCurrentIndex(index);
          },
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Início',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: 'Explorar',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              label: 'Favoritos',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.local_activity),
              label: 'Ingressos',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Perfil',
            ),
          ],
          elevation: 0,
          showUnselectedLabels: true,
          showSelectedLabels: true,
          type: BottomNavigationBarType.fixed,
        ),
        body: pages[navigationStore.currentIndex],
      );
    });
  }
}
