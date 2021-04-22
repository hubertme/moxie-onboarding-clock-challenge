import 'dart:io';

import 'package:flutter/material.dart';
import 'package:onboarding_clock_challenge/onboarding_clock_app.dart';
import 'package:onboarding_clock_challenge/util/hive_util.dart';
import 'package:path_provider/path_provider.dart';

void initialiseAllServices(Function callback) async {
  print('Timestamp start: ${DateTime.now()}');

  // Initialise all services here
  Directory appDocDirectory = await getApplicationDocumentsDirectory();
  HiveUtil.openDefaultBox(appDocDirectory.path);

  callback();
  print('Timestamp end: ${DateTime.now()}');
}

void main() {
  // All pre-initialisation process
  WidgetsFlutterBinding.ensureInitialized();

  initialiseAllServices(() {
    runApp(
        OnboardingClockApp()
    );
  });
}
