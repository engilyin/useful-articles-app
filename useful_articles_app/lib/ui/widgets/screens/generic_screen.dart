

import 'package:flutter/material.dart';
import 'package:useful_articles_app/ui/widgets/navigation/main_menu_drawer.dart';

class GenericScreen extends StatelessWidget {
  final _scaffold = GlobalKey();

  final Widget child;

  GenericScreen({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffold,
      appBar: AppBar(
        title: Text('App Title'),
      ),
      drawer: MainMenuDrawer(
        // Drawer content
      ),
      body: Column(
        children: [
          // Child widget (specific screen content)
          Expanded(
            child: child,
          ),
        ],
      ),
    );
  }
}