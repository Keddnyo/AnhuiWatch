import 'package:firedart/firedart.dart';
import 'package:flutter/material.dart';

import 'src/app/application.dart';

void main() {
  Firestore.initialize('anhuiwatch');
  runApp(const Application());
}
