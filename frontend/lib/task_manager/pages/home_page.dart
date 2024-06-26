import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// import '../widgets/sidebar.dart';
import '../widgets/big_card.dart';
import '../widgets/my_app_state.dart';

export 'home_page.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<MyAppState>(context);
    var pair = appState.current;

    IconData icon;
    if (appState.favorites.contains(pair)) {
      icon = Icons.favorite;
    } else {
      icon = Icons.favorite_border;
    }

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BigCard(pair: pair),
          SizedBox(height: 10),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              ElevatedButton.icon(
                onPressed: () {
                  appState.toggleFavorite();
                },
                icon: Icon(icon),
                label: Text('Like'),
              ),
              SizedBox(width: 10),
              ElevatedButton(
                onPressed: () {
                  appState.getNext();
                },
                child: Text('Next'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
