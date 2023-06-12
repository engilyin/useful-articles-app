import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:useful_articles_app/services/commands/current_command_service.dart';
import 'package:useful_articles_app/services/locator.dart';

@RoutePage()
class BusyScreen extends StatefulWidget {

  const BusyScreen({super.key});

  @override
  BusyScreenState createState() => BusyScreenState();
}

class BusyScreenState extends State<BusyScreen> {

  @override
  void initState() {
    super.initState();
    startBackgroundOperation();
  }

  void startBackgroundOperation() async {
    final currentCommandService = locator<CurrentCommandService>();
    await currentCommandService.executeCurrent();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: [
      // Background Image
      Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/login_bg.jpg"),
            fit: BoxFit.cover,
          ),
        ),
      ),
      const Positioned.fill(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Spinning Wheel
            CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
            ),
            SizedBox(height: 16),
            Text(
              'Please Wait...',
              style: TextStyle(
                color: Colors.white,
                fontSize: 22,
              ),
            ),
          ],
        ),
      ),
    ]));
  }
}
