import 'package:flutter/material.dart';
import 'package:useful_articles_app/ui/widgets/generic_screen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GenericScreen(
      child: Center(
        child: Text('Hello there!'),
      ),
    );
  }
}