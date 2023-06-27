import 'package:flutter/material.dart';
import 'package:useful_articles_app/ui/widgets/decor/background.dart';

class SimpleScreen extends StatelessWidget {
  final _scaffold = GlobalKey();

  final Widget child;

  final String backgroundImage;

  SimpleScreen({super.key, required this.child, required this.backgroundImage});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffold,
      body: Stack(
        children: [
          Background(backgroundImage),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Expanded(
              child: child,
            ),
          ),
        ],
      ),
    );
  }
}
