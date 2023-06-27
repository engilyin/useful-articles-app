import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:useful_articles_app/ui/widgets/screens/generic_screen.dart';

@RoutePage()
class AccountScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GenericScreen(
      child: Center(
        child: Text('Account!'),
      ),
    );
  }
}