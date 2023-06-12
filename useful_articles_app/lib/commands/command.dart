import 'package:flutter/material.dart';


abstract class Command {

  void run();

  String nextScreen();

}
