

import 'package:flutter/material.dart';

class GenericScreen extends StatelessWidget {

  final Widget child;

  GenericScreen({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('App Title'),
      ),
      drawer: Drawer(
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