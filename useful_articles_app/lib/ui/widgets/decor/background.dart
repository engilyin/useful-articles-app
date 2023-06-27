import 'package:flutter/widgets.dart';

class Background extends StatelessWidget {

  final String imageName;

  Background(this.imageName);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/$imageName"),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}